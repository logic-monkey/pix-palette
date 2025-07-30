extends CanvasLayer

var palettes := {}
var is_viz := false

func _ready() -> void:
	%ui.modulate = Color.TRANSPARENT

func register_palette(title:String, colors: PXPixelPalette)->PIXEL_PAL:
	if title in palettes: 
		palettes[title][1] += 1
		return palettes[title][0]
	else:
		var pal = preload("res://addons/pix-palette/palette.tscn").instantiate()
		pal.palette = colors
		pal.title = title
		palettes[title] = [pal, 1]
		%pal_list.add_child(pal)
		return pal

func delete_palette(title:String):
	if not title in palettes: return
	palettes[title][1]-=1
	if palettes[title][1] == 0:
		var p = palettes[title][0]
		palettes.erase(title)
		%pal_list.remove_child(p)
		p.queue_free()
		
func _process(delta: float) -> void:
	if not InputMap.has_action("cheat"): return
	if Input.is_action_pressed("cheat"):
		if Input.is_action_just_pressed("c_toggle_rainboy"):
			rainboy_on = !rainboy_on
		if Input.is_action_just_pressed("c_show_palettes"):
			is_viz = !is_viz
			var c = Color.WHITE if is_viz else Color.TRANSPARENT
			var tw = create_tween()
			tw.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
			tw.tween_property(%ui, "modulate", c, 0.25)

var rainboy_amt : float :
	get: return PIXEL_PAL.rainboy
	set(v):
		PIXEL_PAL.rainboy = v
		for pal in palettes:
			palettes[pal][0].palette_changed()
var rainboy_on : bool = true:
	set(v): 
		rainboy_on = v
		var delta_val = 1 if rainboy_on else 0
		var tw = create_tween()
		tw.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
		tw.tween_property(self, "rainboy_amt", delta_val,0.25)\
				.set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN_OUT)
