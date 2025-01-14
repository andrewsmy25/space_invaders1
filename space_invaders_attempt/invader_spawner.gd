extends Node2D

var invader_scene = preload("res://enemy.tscn")

const ROWS = 4
const COLUMNS = 7
const HORIZONTAL_SPACING = 32
const VERTICAL_SPACING = 32
const START_Y = 50
const X_INCREMENT = 10
const Y_INCREMENT = 20

var velocity: Vector2

var movement_direction = 1

#NODE REFERENCES
@onready var movement_timer = $MovementTimer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	movement_timer.timeout.connect(move_invaders)
	position = Vector2(250,50)
	
	for row in ROWS:
		for col in COLUMNS:
			var spawn_pos = Vector2((col * 100),(row*75))
			spawn_invader(spawn_pos)

func _process(delta: float) -> void:
	velocity = velocity * movement_direction * delta

func move_invaders():
	position.x += X_INCREMENT * movement_direction

func spawn_invader(pos: Vector2):
	var invader = invader_scene.instantiate()
	invader.position = pos
	add_child(invader)

func _on_left_wall_body_entered(body: Node2D) -> void:
	if (movement_direction == -1):
		position.y += Y_INCREMENT
		movement_direction = 1
		movement_timer.wait_time = movement_timer.wait_time - .02

func _on_right_wall_body_entered(body: Node2D) -> void:
	if (movement_direction == 1):
		position.y += Y_INCREMENT
		movement_direction = -1
		movement_timer.wait_time = movement_timer.wait_time - .02
