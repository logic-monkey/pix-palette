@tool
extends Node
class_name Rainboy

static var FG_BLACK = 				Color("000000")
static var FG_DARK = 				Color("a1899b")
static var FG_LIGHT = 				Color("d7d2cf")
static var FG_WHITE = 				Color("ffffff")

static var BG_BLACK = 				Color("626774")
static var BG_DARK = 				Color("96a1a7")
static var BG_LIGHT = 				Color("c5ccc8")
static var BG_WHITE = 				Color("eae9e6")

static var colors = \
		[
			FG_BLACK, FG_DARK, FG_LIGHT, FG_WHITE,
			BG_BLACK, BG_DARK, BG_LIGHT, BG_WHITE
		]
enum rb \
	{
		FG_Black, FG_Dark, FG_Light, FG_White,
		BG_Black, BG_Dark, BG_Light, BG_White
	}
