extends Node3D
var selected = 0
#yellow
@onready var yellow_selecting_false = $yellow/Label3D3
@onready var yellow_selecting_true = $yellow/Label3D8
var yellow_prize = 20
@onready var yellow_prize_sign = $yellow/coin7
#green
@onready var green_selecting_false = $green/Label3D9
@onready var green_selecting_true = $green/Label3D10
var green_prize = 20
@onready var green_prize_sign = $green/coin4

#blue
@onready var blue_selecting_false = $blue/Label3D5
@onready var blue_selecting_true = $blue/Label3D7
@onready var anim = $"../AnimationPlayer"

#spike
@onready var spike_selecting_false = $spike/Label3D15
@onready var spike_selecting_true = $spike/Label3D16
var spike_prize = 30
@onready var spike_prize_sign = $spike/coin2

#earth
@onready var earth_selecting_false = $earth/Label3D3
@onready var earth_selecting_true = $earth/Label3D4
var earth_prize = 30
@onready var earth_prize_sign = $earth/coin2


#art
@onready var art_selecting_false = $art/Label3D3
@onready var art_selecting_true = $art/Label3D4
var art_prize = 40
@onready var art_prize_sign = $art/coin3

#eye 
@onready var eye_selecting_false = $eye/Label3D5
@onready var eye_selecting_true = $eye/Label3D6
var eye_prize = 50
@onready var eye_prize_sign = $eye/coin2
 #brick
@onready var brick_selecting_false = $brick/Label3D14
@onready var brick_selecting_true = $brick/Label3D15
var brick_prize = 50
@onready var brick_prize_sign = $brick/coin6
#bounce
@onready var bounce_selecting_false = $bounce/Label3D7
@onready var bounce_selecting_true = $bounce/Label3D8
var bounce_prize = 60
@onready var bounce_prize_sign = $bounce/coin3
#anti_gravity
@onready var gravity_selecting_false = $anti_gravity/Label3D11
@onready var gravity_selecting_true = $anti_gravity/Label3D16
var gravity_prize = 70
@onready var gravity_prize_sign = $anti_gravity/coin5

#Called when the node enters the scene tree for the first time.
func _ready():
	selected = 0
	yellow_selecting_false.visible = false
	yellow_selecting_true.visible = false
	green_selecting_false.visible = false
	green_selecting_true.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Pole.global_selecting = selected
	#yellow
	if Pole.cleary == 1:
		if Input.is_action_just_pressed("jump"):
			if Pole.yellow == 0: 
				if Pole.money > yellow_prize or Pole.money == yellow_prize:
					Pole.money -= yellow_prize
					yellow_prize_sign.visible = false
					anim.play("bought")
					Pole.yellow = 1
				else:
					anim.play("buying")
			if Pole.yellow == 1:
				if not selected == 1:
					selected = 1
		if Pole.yellow == 1:
			if not selected == 1:
				
				
				yellow_selecting_false.visible = true
				yellow_selecting_true.visible = false
			else:
				yellow_selecting_false.visible = false
				yellow_selecting_true.visible = true
	#blue
	if Pole.cleary == 0:
		if Input.is_action_just_pressed("jump"):
			if not selected == 0:
				selected = 0
		if selected == 0:
			blue_selecting_false.visible = false
			blue_selecting_true.visible = true
		else: 
			blue_selecting_false.visible = true
			blue_selecting_true.visible = false
	#green
	if Pole.cleary == 2:
		if Input.is_action_just_pressed("jump"):
			if Pole.green == 0: 
				if Pole.money > green_prize or Pole.money == green_prize:
					Pole.money -= green_prize
					green_prize_sign.visible = false
					anim.play("bought")
					Pole.green = 1
				else:
					anim.play("buying")
			if Pole.green == 1:
				if not selected == 2:
					selected = 2
		if Pole.green == 1:
			if not selected == 2:
				
				
				green_selecting_false.visible = true
				green_selecting_true.visible = false
			else:
				green_selecting_false.visible = false
				green_selecting_true.visible = true
	#spike
	if Pole.cleary == 3:
		if Input.is_action_just_pressed("jump"):
			if Pole.spike == 0: 
				if Pole.money > spike_prize or Pole.money == spike_prize:
					Pole.money -= spike_prize
					spike_prize_sign.visible = false
					anim.play("bought")
					Pole.spike = 1
				else:
					anim.play("buying")
			if Pole.spike == 1:
				if not selected == 3:
					selected = 3
		if Pole.spike == 1:
			if not selected == 3:
				
				
				spike_selecting_false.visible = true
				spike_selecting_true.visible = false
			else:
				spike_selecting_false.visible = false
				spike_selecting_true.visible = true
	#earth
	if Pole.cleary == 4:
		if Input.is_action_just_pressed("jump"):
			if Pole.earth == 0: 
				if Pole.money > earth_prize or Pole.money == earth_prize:
					Pole.money -= earth_prize
					earth_prize_sign.visible = false
					anim.play("bought")
					Pole.earth = 1
				else:
					anim.play("buying")
			if Pole.earth == 1:
				if not selected == 4:
					selected = 4
		if Pole.earth == 1:
			if not selected == 4:
				
				
				earth_selecting_false.visible = true
				earth_selecting_true.visible = false
			else:
				earth_selecting_false.visible = false
				earth_selecting_true.visible = true
	#art
	if Pole.cleary == 5:
		if Input.is_action_just_pressed("jump"):
			if Pole.art == 0: 
				if Pole.money > art_prize or Pole.money == art_prize:
					Pole.money -= art_prize
					art_prize_sign.visible = false
					anim.play("bought")
					Pole.art = 1
				else:
					anim.play("buying")
			if Pole.art == 1:
				if not selected == 5:
					selected = 5
		if Pole.art == 1:
			if not selected == 5:
				
				
				art_selecting_false.visible = true
				art_selecting_true.visible = false
			else:
				art_selecting_false.visible = false
				art_selecting_true.visible = true
	#eye
	if Pole.cleary == 6:
		if Input.is_action_just_pressed("jump"):
			if Pole.eye == 0: 
				if Pole.money > eye_prize or Pole.money == eye_prize:
					Pole.money -= eye_prize
					eye_prize_sign.visible = false
					anim.play("bought")
					Pole.eye = 1
				else:
					anim.play("buying")
			if Pole.eye == 1:
				if not selected == 6:
					selected = 6
		if Pole.eye == 1:
			if not selected == 6:
				
				
				eye_selecting_false.visible = true
				eye_selecting_true.visible = false
			else:
				eye_selecting_false.visible = false
				eye_selecting_true.visible = true
	#brick
	if Pole.cleary == 7:
		if Input.is_action_just_pressed("jump"):
			if Pole.brick == 0: 
				if Pole.money > brick_prize or Pole.money == brick_prize:
					Pole.money -= brick_prize
					brick_prize_sign.visible = false
					anim.play("bought")
					Pole.brick = 1
				else:
					anim.play("buying")
			if Pole.brick == 1:
				if not selected == 7:
					selected = 7
		if Pole.brick == 1:
			if not selected == 7:
				
				
				brick_selecting_false.visible = true
				brick_selecting_true.visible = false
			else:
				brick_selecting_false.visible = false
				brick_selecting_true.visible = true
	#bounce 
	if Pole.cleary == 8:
		if Input.is_action_just_pressed("jump"):
			if Pole.bounce == 0: 
				if Pole.money > bounce_prize or Pole.money == bounce_prize:
					Pole.money -= bounce_prize
					bounce_prize_sign.visible = false
					anim.play("bought")
					Pole.bounce = 1
				else:
					anim.play("buying")
			if Pole.bounce == 1:
				if not selected == 8:
					selected = 8
		if Pole.bounce == 1:
			if not selected == 8:
				
				
				bounce_selecting_false.visible = true
				bounce_selecting_true.visible = false
			else:
				bounce_selecting_false.visible = false
				bounce_selecting_true.visible = true
	#anti_gravity
	if Pole.cleary == 9:
		if Input.is_action_just_pressed("jump"):
			if Pole.gravity == 0: 
				if Pole.money > gravity_prize or Pole.money == gravity_prize:
					Pole.money -= gravity_prize
					gravity_prize_sign.visible = false
					anim.play("bought")
					Pole.gravity = 1
				else:
					anim.play("buying")
			if Pole.gravity == 1:
				if not selected == 9:
					selected = 9
		if Pole.gravity == 1:
			if not selected == 9:
				
				
				gravity_selecting_false.visible = true
				gravity_selecting_true.visible = false
			else:
				gravity_selecting_false.visible = false
				gravity_selecting_true.visible = true
