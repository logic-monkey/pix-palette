@tool
extends EditorPlugin


func _enter_tree():
	var new_picker_presets = []
	for c in RainbowRose.colors:
		if c != Color.TRANSPARENT: new_picker_presets.append(c)
	for c in Rainboy.colors:
		new_picker_presets.append(c)
	EditorInterface.get_editor_settings().set_project_metadata("color_picker", "presets", new_picker_presets)
	pass

func _exit_tree():
	# Clean-up of the plugin goes here.
	pass
