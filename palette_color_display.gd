extends EditorProperty

var rect = ColorRect.new()

func _init():
	add_child(rect)
	rect.focus_mode = Control.FOCUS_ALL
	add_focusable(rect)
	
func _update_property():
	var ob = get_edited_object()[get_edited_property()]
	if ob is PXColorBASE: rect.color = ob._DATA
	else: rect.color = Color.MAGENTA
