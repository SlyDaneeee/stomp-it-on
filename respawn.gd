extends Node3D

@onready var spawn1 = $"../opening"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Pole.check == 1:
		position.z = -18.23
		position.x = 8.902
		position.y = -0.409
	if Pole.check == 2:
		position.z = 0.465
		position.x = 21.986
		position.y = 62.934
	if Pole.check == 3:
		position.z = -10.736
		position.x = -30.913
		position.y = 126.156
	if Pole.check == 4:
		position.z = -11.656
		position.x = 13.287
		position.y = 184.113
	#if Pole.check == 1:
		#global_position = spawn1.global_position
