extends Area2D

#const DINO_START_POS := Vector2i(150, 485)
#const CAM_START_POS := Vector2i(576, 324)
#
#var speed : float
#const START_SPEED : float = 10.0
#const MAX_SPEED : int = 25

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	get_tree().change_scene_to_file("res://scenes/dead.tscn")
