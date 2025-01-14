extends CharacterBody2D


const SPEED = 400.0
var screen_y: int
var screen_x: int

var bullet_path = preload("res://bullet.tscn")

func _ready():
	screen_x = get_viewport_rect().size.x
	screen_y = get_viewport_rect().size.y
	position.x = screen_x / 2
	position.y = screen_y - 20

func _physics_process(delta: float) -> void:
	position = position.clamp(Vector2.ZERO, Vector2(screen_x, screen_y))
	if Input.is_action_pressed("move_left"):
		position.x -= SPEED * delta
	if Input.is_action_pressed("move_right"):
		position.x += SPEED * delta
	if Input.is_action_just_pressed("shoot"):
		fire()

func fire():
	var bullet = bullet_path.instantiate()
	bullet.global_position.x = $Muzzle.global_position.x
	bullet.position.y = $Muzzle.global_position.y
	get_parent().add_child(bullet)
	
