@tool
extends Resource
class_name PXPixelPalette

@export
var color0: PXColorBASE:
	get:
		return color0
	set(value):
		if color0:
			color0.data_changed.disconnect(_on_color_changed)
		color0 = value
		if value:
			color0.data_changed.connect(_on_color_changed)
		signal_change()
@export
var color1: PXColorBASE:
	get:
		return color1
	set(value):
		if color1:
			color1.data_changed.disconnect(_on_color_changed)
		color1 = value
		if value:
			color1.data_changed.connect(_on_color_changed)
		signal_change()
@export
var color2: PXColorBASE:
	get:
		return color2
	set(value):
		if color2:
			color2.data_changed.disconnect(_on_color_changed)
		color2 = value
		if value:
			color2.data_changed.connect(_on_color_changed)
		signal_change()
@export
var color3: PXColorBASE:
	get:
		return color3
	set(value):
		if color3:
			color3.data_changed.disconnect(_on_color_changed)
		color3 = value
		if value:
			color3.data_changed.connect(_on_color_changed)
		signal_change()
@export
var color4: PXColorBASE:
	get:
		return color4
	set(value):
		if color4:
			color4.data_changed.disconnect(_on_color_changed)
		color4 = value
		if value:
			color4.data_changed.connect(_on_color_changed)
		signal_change()
@export
var color5: PXColorBASE:
	get:
		return color5
	set(value):
		if color5:
			color5.data_changed.disconnect(_on_color_changed)
		color5 = value
		if value:
			color5.data_changed.connect(_on_color_changed)
		signal_change()
@export
var color6: PXColorBASE:
	get:
		return color6
	set(value):
		if color6:
			color6.data_changed.disconnect(_on_color_changed)
		color6 = value
		if value:
			color6.data_changed.connect(_on_color_changed)
		signal_change()
@export
var color7: PXColorBASE:
	get:
		return color7
	set(value):
		if color7:
			color7.data_changed.disconnect(_on_color_changed)
		color7 = value
		if value:
			color7.data_changed.connect(_on_color_changed)
		signal_change()
			
signal palette_changed
func _on_color_changed():
	palette_changed.emit()
	signal_change()
	
func signal_change():
	emit_changed()
	notify_property_list_changed()
