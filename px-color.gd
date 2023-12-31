@tool
extends PXColorBASE
class_name PXColor

@export
var color : Color = Color.BLACK:
	get:
		return _cb
	set(value):
		_cb = value
		emit_changed()

@export
var luminance : float = 1.0:
	get:
		return _l
	set(value):
		_l = value
		emit_changed()
