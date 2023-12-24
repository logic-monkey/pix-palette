@tool
extends PXPaletteColorBASE
class_name PXRosePetal

@export
var color : Color = Color.BLACK:
	get:
		return _cb
	set(value):
		_cb = value
		emit_changed()
		notify_property_list_changed()

@export
var luminance : float = 1.0:
	get:
		return _l
	set(value):
		_l = value
		emit_changed()
		notify_property_list_changed()
