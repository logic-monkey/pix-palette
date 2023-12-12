@tool
extends EditorPlugin

var plugin
var plugin2

func _enter_tree():
	var new_picker_presets = []
	for c in RainbowRose.colors:
		if c != Color.TRANSPARENT: new_picker_presets.append(c)
	for c in Rainboy.colors:
		new_picker_presets.append(c)
	EditorInterface.get_editor_settings().set_project_metadata("color_picker", "presets", new_picker_presets)
	plugin = preload("res://addons/pix-palette/editor-inspecter-plugin.gd").new()
	plugin2 = preload("res://addons/pix-palette/colorpreview.gd").new()
	add_inspector_plugin(plugin)
	add_inspector_plugin(plugin2)


func _exit_tree():
	remove_inspector_plugin(plugin)
	remove_inspector_plugin(plugin2)
