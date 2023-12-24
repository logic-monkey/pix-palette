@tool
extends Resource
class_name PXColorBASE

signal data_changed
var _cb : Color = Color.BLACK:
	get:
		return _cb
	set(value):
		_cb = value
		_DATA = Color(_cb.r * _l, _cb.g * _l, _cb.b * _l, _cb.a)
		data_changed.emit()
		emit_changed()
		notify_property_list_changed()
var _l : float = 1.0:
	get:
		return _l
	set(value):
		_l = value
		_DATA = Color(_cb.r * _l, _cb.g * _l, _cb.b * _l, _cb.a)
		data_changed.emit()
		emit_changed()
		notify_property_list_changed()
@export
var _DATA : Color
	#get:
		#return Color(_cb.r * _l, _cb.g * _l, _cb.b * _l, _cb.a)

func get_color()->Color:
	return _DATA
