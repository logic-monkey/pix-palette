@tool
extends PXPaletteColorBASE
class_name PXRoseBlend

@export
var color1 : Color = RainbowRose.SPACER:
	get:
		return color1
	set(value):
		if value == RainbowRose.BLACK: value = RainbowRose.SPACER
		color1 = value
		_cb = color1.lerp(color2,0.5)
		emit_changed()
		notify_property_list_changed()
@export
var color2: Color = RainbowRose.SPACER:
	get:
		return color2
	set(value):
		if value == RainbowRose.BLACK: value = RainbowRose.SPACER
		color2 = value
		_cb = color1.lerp(color2,0.5)
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
