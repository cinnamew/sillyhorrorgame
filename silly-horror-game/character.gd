extends Node2D

@export var pos = Vector2(4, 3)

func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Left"):
		$AnimatedSprite2D.play("top_left_idle")
		pos += Vector2(-1, 0)
	if Input.is_action_just_pressed("Right"):
		$AnimatedSprite2D.play("bottom_right_idle")
		pos += Vector2(1, 0)
	if Input.is_action_just_pressed("Up"):
		$AnimatedSprite2D.play("top_right_idle")
		pos += Vector2(0, -1)
	if Input.is_action_just_pressed("Down"):
		$AnimatedSprite2D.play("bottom_left_idle")
		pos += Vector2(0, 1)
