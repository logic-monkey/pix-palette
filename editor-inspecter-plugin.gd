extends EditorInspectorPlugin

var button = preload("res://addons/pix-palette/palette_button.gd")
var color_panel = preload("res://addons/pix-palette/palette_color_display.gd")

func _can_handle(object):
	return object is PXPaletteColorBASE or object is PXPixelPalette
	
func _parse_property(object, type, name, hint_type, hint_string, usage_flags, wide):
	if object is PXPaletteColorBASE and type == TYPE_COLOR and name !="_DATA":
		add_property_editor(name, button.new())
		return true
	elif object is PXPixelPalette:
		add_property_editor(name, color_panel.new())
		return false
	else:
		return false
