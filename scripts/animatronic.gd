extends Node

class_name animatronic

onready var timer : Timer = get_node("Timer") 
onready var anim : AnimationPlayer = get_node("AnimationPlayer")

export var anim_name = ""
export var _c_confs = ""
export var states = []

var current_state : state = states[0]
var next_state : state

func _ready():
	makeStep()
	pass

func Shuganut():
	
	pass

func makeStep():
	
	pass
	

