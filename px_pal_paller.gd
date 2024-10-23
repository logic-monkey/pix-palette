extends Node
class_name PXPaller

@export_node_path("CanvasItem") var target
var _target: CanvasItem

@export var palette_name : String

@export var palette: PXPixelPalette
var pal: PIXEL_PAL

func _ready() -> void:
	if target:
		_target = get_node(target)
	else:
		_target = owner
	pal = _PAL.register_palette(palette_name, palette)
	_target.material = pal.material
	
func _exit_tree() -> void:
	_PAL.delete_palette(palette_name)
