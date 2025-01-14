extends Area2D

var SPEED = 600
var bullet_x: int
var bullet_y: int

func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y -= SPEED * delta


func _on_body_entered(body: Node2D) -> void:
	body.enemy_hit()
	queue_free()
