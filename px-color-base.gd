extends Resource
class_name PXColorBASE

var _cb : Color = Color.BLACK
var _l : float = 1.0
var _DATA : Color:
	get:
		return Color(_cb.r * _l, _cb.g * _l, _cb.b * _l, _cb.a)

func get_color()->Color:
	return _DATA
