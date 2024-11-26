extends MeshInstance3D
@onready var pink = $"../pink_cylinder2/pinky_part"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position = pink.global_position
