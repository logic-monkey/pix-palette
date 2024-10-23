extends Control
class_name PIXEL_PAL

static var rainboy : float = 1

@export var palette: PXPixelPalette:
	set(p):
		if palette: palette.palette_changed.disconnect(palette_changed)
		palette = p
		if palette:
			palette.palette_changed.connect(palette_changed)
			palette.palette_changed.emit()

func _ready() -> void:
	if palette and not palette.palette_changed.is_connected(palette_changed):
		palette.palette_changed.connect(palette_changed)

func palette_changed():
	if not palette: return
	var m = material as ShaderMaterial
	if palette.color0: m.set_shader_parameter("palette_0", palette.color0._DATA.lerp(Rainboy.colors[palette.rb_0], rainboy))
	if palette.color1: m.set_shader_parameter("palette_1", palette.color1._DATA.lerp(Rainboy.colors[palette.rb_1], rainboy))
	if palette.color2: m.set_shader_parameter("palette_2", palette.color2._DATA.lerp(Rainboy.colors[palette.rb_2], rainboy))
	if palette.color3: m.set_shader_parameter("palette_3", palette.color3._DATA.lerp(Rainboy.colors[palette.rb_3], rainboy))
	if palette.color4: m.set_shader_parameter("palette_4", palette.color4._DATA.lerp(Rainboy.colors[palette.rb_4], rainboy))
	if palette.color5: m.set_shader_parameter("palette_5", palette.color5._DATA.lerp(Rainboy.colors[palette.rb_5], rainboy))
	if palette.color6: m.set_shader_parameter("palette_6", palette.color6._DATA.lerp(Rainboy.colors[palette.rb_6], rainboy))
	if palette.color7: m.set_shader_parameter("palette_7", palette.color7._DATA.lerp(Rainboy.colors[palette.rb_7], rainboy))

@export var title: String:
	set(v):
		title = v
		%name.text = v
