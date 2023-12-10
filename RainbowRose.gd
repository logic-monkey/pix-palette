@tool
extends Node
class_name RainbowRose

static var TRANSPARENT =		Color.TRANSPARENT

static var BLACK = 				Color("000000")
static var WHITE = 				Color("ffffff")

static var LIGHT_GRAY = 		Color("d6d9d5")
static var MID_LIGHT_GRAY = 	Color("b3b6b2")
static var MID_DARK_GRAY = 		Color("90928f")
static var DARK_GRAY = 			Color("767875")

static var OK = 				Color("f7eedb")
static var SEACLOUD =			Color("e6f9e7")
static var MAGICLOUD =  		Color("eee0f2")

static var MEAT = 				Color("edabb4")
static var PEACH = 				Color("f7c9b0")
static var ANTIQUE = 			Color("f6e961")
static var SEAMIST = 			Color("b9d5c8")
static var SKY = 				Color("9fd7e6")
static var LAVENDER = 			Color("cebce2")

static var RED = 				Color("f94c5c")
static var ORANGE = 			Color("f4aa00")
static var BROWN = 				Color("c29861")
static var GREEN = 				Color("94cc12")
static var BAY = 				Color("7bb79d")
static var CYAN = 				Color("2ed1d1")
static var BLUE = 				Color("2b93f9")
static var PURPLE = 			Color("9a6ff6")

static var MAROON = 			Color("995288")
static var LOAM = 				Color("848264")
static var SHERWOOD = 			Color("6a9775")
static var SHADOW = 			Color("65869a")
static var PRINCE = 			Color("8570c2")

static var BLOODLINE = 			Color("604559")
static var EARTHLINE = 			Color("5d5e53")
static var SKYLINE = 			Color("4f4e74")

static var SPACER = 			Color("3b3c3a")

static var colors :=\
		[
			TRANSPARENT, BLACK, WHITE,
			
			LIGHT_GRAY, MID_LIGHT_GRAY, MID_DARK_GRAY, DARK_GRAY,
			
			OK,SEACLOUD, MAGICLOUD,
			
			MEAT, PEACH, ANTIQUE, SEAMIST, SKY, LAVENDER,
			
			RED, ORANGE, BROWN, GREEN, BAY, CYAN, BLUE, PURPLE,
			
			MAROON, LOAM, SHERWOOD, SHADOW, PRINCE,
			
			BLOODLINE, EARTHLINE, SKYLINE,
			
			SPACER,
		]

static var friendly_names :=\
		[
			"transparent", "black", "white",
			
			"light gray", "mid-light gray", "mid-dark gray", "dark gray",
			
			"ok", "seacloud", "magicloud",
			
			"meat", "peach", "antique", "seamist", "sky", "lavender",
			
			"red", "orange", "brown", "green", "bay", "cyan", "blue", "purple",
			
			"maroon", "loam", "sherwood", "shadow", "prince",
			
			"bloodline", "earthline", "skyline",
			
			"spacer",
		]
		
static func mix(color1, color2) -> Color:
	color1 = rectify_color(color1)
	color2 = rectify_color(color2)
	if color1 == Color.MAGENTA or color2 == Color.MAGENTA: return Color.MAGENTA
	color1.lerp(color2, 0.5)
	return color1
	
static func rectify_color(color) -> Color:
	if color is Color: return color
	if color is int:
		if color < 0 or color >= colors.size():
			return Color.MAGENTA
		else:
			return colors[color]
	if color is String:
		if friendly_names.has(color.to_lower()):
			var id = friendly_names.find(color.to_lower())
			return rectify_color(id)
		else:
			return Color.MAGENTA
	return Color.MAGENTA
