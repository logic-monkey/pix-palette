extends EditorInspectorPlugin

var button = preload("res://addons/pix-palette/palette_button.gd")

func _can_handle(object):
	return object is PXColorPaletteBASE
	
func _parse_property(object, type, name, hint_type, hint_string, usage_flags, wide):
	if type == TYPE_COLOR:
		add_property_editor(name, button.new())
		return true
	else:
		return false
