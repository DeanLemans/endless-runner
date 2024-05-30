extends Node

var spike_scene = preload("res://scenes/spike.tscn")
var obstacle_template := [spike_scene]
var obstacles : Array = []

const PLAYER_START_POS := Vector2(150, 485)
const CAM_START_POS := Vector2(576, 324)

var speed : float
const START_SPEED : float = 10.0
const MAX_SPEED : int = 25
var screen_size : Vector2
var ground_height : int
var last_obst = null

func _ready():
	screen_size = get_viewport().size
	ground_height = $Ground.get_node("Sprite2D").texture.get_height()
	new_game()

func new_game():
	$CharacterBody2D.position = PLAYER_START_POS
	$CharacterBody2D.velocity = Vector2(0, 0)
	$Camera2D.position = CAM_START_POS
	$Ground.position = Vector2(0, 0)
	obstacles.clear()  # Clear the obstacles array at the start of a new game
	last_obst = null  # Reset last_obst

func _process(delta):
	speed = START_SPEED
	
	generate_obst()
	
	$CharacterBody2D.position.x += speed
	$Camera2D.position.x += speed
	
	if $Camera2D.position.x - $Ground.position.x > screen_size.x * 1.5:
		$Ground.position.x += screen_size.x

func generate_obst():
	if obstacles.is_empty() or (last_obst != null and $Camera2D.position.x - last_obst.position.x > randi_range(300, 500)):
		var obst_type = obstacle_template[randi() % obstacle_template.size()]
		var obst = obst_type.instantiate()
		var sprite = obst.get_node("Sprite2D")
		
		if sprite != null and sprite.texture != null:
			var obst_height = sprite.texture.get_height()
			var obst_scale = sprite.scale
			var obst_x : int = $Camera2D.position.x + randi_range(250, 550)
			var obst_y : int = screen_size.y - ground_height - (obst_height * obst_scale.y) / 5
			
			last_obst = obst
			add_obst(obst, obst_x, obst_y)
		else:
			print("Error: Sprite2D node or its texture is null")

func add_obst(obst, x, y):
	obst.position = Vector2(x, y)
	add_child(obst)
	obstacles.append(obst)
	print("Obstacle at: ", Vector2(x, y))
