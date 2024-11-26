extends Node3D
@onready var ghost = $"../orange_tone_ghost"
@onready var stiti = $StaticBody3D
@onready var half = $"../orange_tone_half"
var nor

# Called when the node enters the scene tree for the first time.
func _ready():
	half.visible = false
	var nor = stiti.global_position
	ghost.visible = false
	repeat()


# Called every frame. 'delta' is the elapsed time since the previous frame.

func repeat():
	stiti.global_position = self.global_position
	self.visible = true
	ghost.visible = false
	await get_tree().create_timer(3.5).timeout
	self.visible = false
	half.visible = true
	ghost.visible = false
	await get_tree().create_timer(1).timeout
	half.visible = false
	stiti.position.x = 1000000
	self.visible = false
	ghost.visible = true
	await get_tree().create_timer(3.5).timeout
	stiti.global_position = self.global_position
	self.visible = false
	half.visible = true
	ghost.visible = false
	await get_tree().create_timer(1).timeout
	half.visible = false
	stiti.global_position = self.global_position
	self.visible = true
	ghost.visible = false
	repeat()
