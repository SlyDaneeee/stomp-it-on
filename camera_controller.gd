extends Node3D

@onready var yaw_node = $camyaw
@onready var pitch_node = $camyaw/campitch
@onready var camera = $camyaw/campitch/Camera3D
var har = 0.0
var minu = -360
var yaw = 0.0
var pitch : float = 0
var falsy = 0
var yaw_acceleration : float = 20.0
signal nope
var mi = 0
signal switch_control
var royt = 1
var yaw_sensitivity : float = 0.1
var pitch_sensitivity : float = 0.1
var ply = 360
var death_velocity
var yaw_accelaration : float = 15
var pitch_accelaration : float = 15

var pitch_max : float = 10
var pitch_min : float = -50
var yaw_max : float = 270
var yaw_min : float = -90

# Called when the node enters the scene tree for the first time.
func _ready():
	yaw = 180
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _input(event):
	if event is InputEventMouseMotion:
		yaw += -event.relative.x * yaw_sensitivity
		pitch += -event.relative.y * pitch_sensitivity
		
		
		
func _physics_process(delta):
	Pole.liner = har
	har = mi + ply + yaw
	if har < 0:
		_nu()
		
	if har > 360:
		_na()
			
	if har == 0:
		ply = 360
	# var2 follows var1, but resets to 0 when var1 reaches 360 seconds
	
	pitch = clamp(pitch, pitch_min, pitch_max)
	#yaw = clamp(yaw, yaw_min, yaw_max)
	#if yaw < 0:
	#	yaw = 0
	
	yaw_node.rotation_degrees.y = lerp(float(yaw_node.rotation_degrees.y), float(yaw), yaw_acceleration * delta)
	pitch_node.rotation_degrees.x = lerp(pitch_node.rotation_degrees.x, pitch, pitch_accelaration * delta)
	if har > 135 and har < 225:
		#down
		Pole.poler = 0
	if har > 290 or har < 45:
		#up
		Pole.poler = 1
	if har > 45 and har < 135:
		#right
		Pole.poler = 3
	if har > 225 and har < 290:
	#left
		Pole.poler = 4
	pass
	if har > 135 and har < 225:
		#down
		Pole.poler = 0
	if har > 290 or har < 45:
		#up
		Pole.poler = 1
	if har > 45 and har < 135:
		#right
		Pole.poler = 3
	if har > 225 and har < 290:
	#left
		Pole.poler = 4
		#emit_signal("switch_control")
	
		#emit_signal("switch_control")pa
		#Pole.poler = 0
	#if yaw > yaw_min:
		#emit_signal("nope")
		#Pole.poler = 1
	#if yaw < yaw_max:
		#emit_signal("nope")
		#Pole.poler = 1
	#if Pole.poler == 1:
		#pass

func _nu():
	ply += 360
func _na():
	mi += -360
	if falsy == 0:
		mi = 360
		await get_tree().create_timer(0.3).timeout
		falsy = 1
