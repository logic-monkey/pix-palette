@tool
extends EditorPlugin

var plugin
#var plugin2

func _enter_tree():
	var new_picker_presets = []
	for c in RainbowRose.colors:
		if c != Color.TRANSPARENT: new_picker_presets.append(c)
	for c in Rainboy.colors:
		new_picker_presets.append(c)
	EditorInterface.get_editor_settings().set_project_metadata("color_picker", "presets", new_picker_presets)
	plugin = preload("res://addons/pix-palette/editor-inspecter-plugin.gd").new()
	add_inspector_plugin(plugin)
	add_autoload_singleton("_PAL", "res://addons/pix-palette/palettes.tscn")


func _exit_tree():
	remove_inspector_plugin(plugin)
	remove_autoload_singleton("_PAL")
