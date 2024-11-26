extends MeshInstance3D
var time := 0.0
var okay = 0
@export var time_offset := 0.0
@export var distance := 2.0
@export var distance_offset := 1.0
@export var speed := 2.0
var tween: Tween
@onready var blue = $"../computers/blue"
@onready var yellow = $"../computers/yellow"
@onready var green =$"../computers/green"
@onready var spike = $"../computers/spike"
@onready var earth =$"../computers/earth"
@onready var art = $"../computers/art"
@onready var eye = $"../computers/eye"
@onready var brick =$"../computers/brick"
@onready var bounce =$"../computers/bounce"
@onready var gravity = $"../computers/anti_gravity"        
@onready var startpos := position
var clear = 0
var clearo = 0
 # or MeshInstance3D, or any 3D object
var translation
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
func _process(delta):
	# Get the mouse position in the viewport
	Pole.cleary = clearo
	if clearo == 0:
		blue.visible = true
	else:
		blue.visible = false
	
	if clearo == 1:
		yellow.visible = true
	else:
		yellow.visible = false
	
	if clearo == 2:
		green.visible = true
	else:
		green.visible = false
	
	if clearo == 3:
		spike.visible = true
	else:
		spike.visible = false
	
	if clearo == 4:
		earth.visible = true
	else:
		earth.visible = false
	
	if clearo == 5:
		art.visible = true
	else:
		art.visible = false
	
	if clearo == 6:
		eye.visible = true
	else:
		eye.visible = false
	
	if clearo == 7:
		brick.visible = true
	else:
		brick.visible = false
	
	if clearo == 8:
		bounce.visible = true
	else:
		bounce.visible = false
	
	if clearo == 9:
		gravity.visible = true
	else:
		gravity.visible = false
	
	if Input.is_action_just_pressed("right"):
		
		if not clear == 9 and okay == 0:
			tween = create_tween()
			tween.set_trans(Tween.TRANS_ELASTIC)
			okay = 1
			clear += 1
			tween.tween_property(self, "position", position + Vector3(0,0,3), 1.5)
			await get_tree().create_timer(0.6).timeout 
			clearo += 1
			await get_tree().create_timer(0.6).timeout 
			okay = 0
			
	if Input.is_action_just_pressed("left"):
		
		if not clear == 0 and okay == 0:
			tween = create_tween()
			tween.set_trans(Tween.TRANS_ELASTIC)
			okay = 1
			clear += -1
			tween.tween_property(self, "position", position + Vector3(0,0,-3), 1.5)
			await get_tree().create_timer(0.6).timeout 
			clearo += -1
			await get_tree().create_timer(0.6).timeout 
			okay = 0
	
