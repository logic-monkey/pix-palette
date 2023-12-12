extends MenuButton

func _ready():
	for i in RainbowRose.colors.size():
		if RainbowRose.colors[i] == Color.TRANSPARENT: continue
		get_popup().set_item_icon_modulate(i, RainbowRose.colors[i])
		get_popup().id_pressed.connect(display_color)
		display_color(0)

signal color_changed(id)

func display_color(i):
	if i < 0: return
	if i >= RainbowRose.colors.size(): return
	text = RainbowRose.friendly_names[i].capitalize()
	$color.color = RainbowRose.colors[i]
	color_changed.emit(i)
	
