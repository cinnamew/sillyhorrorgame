extends Control

func _ready():
	# same as start
	$"VBoxContainer/play button".grab_focus()	#prob doesn't work bc i turned off focus lmao

func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")


func _on_settings_pressed() -> void:
	pass # Replace with function body.


func _on_quit_pressed() -> void:
	get_tree().quit()
