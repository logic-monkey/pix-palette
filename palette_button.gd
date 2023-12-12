extends EditorProperty

var property_control = preload("res://addons/pix-palette/palette_button.tscn").instantiate()
var value = 0

var updating := false

func _init():
	add_child(property_control)
	add_focusable(property_control)
	refresh_property()
	property_control.get_popup().id_pressed.connect(_on_menu_id_pressed)
	for i in RainbowRose.colors.size():
		var clr = RainbowRose.colors[i] 
		if clr == Color.TRANSPARENT: continue
		property_control.get_popup().set_item_icon_modulate(i, clr)

func refresh_property():
	property_control.text = RainbowRose.friendly_names[value].capitalize()
	property_control.get_node("color").color = RainbowRose.colors[value]
	
func _on_menu_id_pressed(id:int):
	if id < 0: return
	if id >= RainbowRose.colors.size(): return
	if updating: return
	
	value = id
	refresh_property()
	emit_changed(get_edited_property(), RainbowRose.colors[id])
	
func _update_property():
	var new_color = get_edited_object()[get_edited_property()]
	if new_color == RainbowRose.colors[value]: return
	if not new_color in RainbowRose.colors: return
	
	updating = true
	value = RainbowRose.colors.find(new_color)
	if value == -1: value = 0
	refresh_property()
	updating = false
	
