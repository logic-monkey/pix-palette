extends EditorInspectorPlugin

func _can_handle(object):
	return object is PXColorBASE

func _parse_begin(object ):
	#if category == "Resource":
	var rect = ColorRect.new()
	var o = object as PXColorBASE
	#rect.color = o._DATA
	rect.custom_minimum_size = Vector2(0,30)
	add_custom_control(rect)
