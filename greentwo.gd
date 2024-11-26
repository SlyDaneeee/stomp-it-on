extends Node3D

# Variables to control scaling speed and range
var scale_speed: float = 1.0  # Controls how fast the scaling happens
var max_scale: float = 2.0  # The maximum size for X and Z axes (2x original)
var min_scale: float = 1.0  # The original size for X and Z axes
var growing: bool = true  # Whether the object is currently growing

# Called every frame
func _process(delta: float) -> void:
	# Check if we're growing or shrinking
	if growing:
		# Increase the scale on the X and Z axes over time
		scale.x += scale_speed * delta
		scale.z += scale_speed * delta
		# If we reach or exceed the maximum scale on both axes, switch to shrinking
		if scale.x >= max_scale:
			growing = false
	else:
		# Decrease the scale on the X and Z axes over time
		scale.x -= scale_speed * delta
		scale.z -= scale_speed * delta
		# If we reach or go below the minimum scale on both axes, switch to growing
		if scale.x <= min_scale:
			growing = true
