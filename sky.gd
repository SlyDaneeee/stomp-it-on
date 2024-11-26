extends AudioStreamPlayer
var plari = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	if plari == 1:
		self.play()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_finished():
	if plari == 1:
		self.play()
	
