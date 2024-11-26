extends Node3D

var time := 0.0
@export var time_offset := 0.0
@export var distance := 2.0
@export var distance_offset := 0.0
@export var speed := 2.0
var do = 0
@onready var startpos := position

func _process(delta):
	_being_ready()
	if do == 1:
		# Sine movement
		position = startpos
		position.y += cos((time + time_offset) * speed/distance) * distance + distance_offset

		time += delta
func _being_ready():
	await get_tree().create_timer(2).timeout
	do = 1
