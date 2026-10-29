
extends Control

var is_starting := false


func _ready() -> void:
	$score.text = "Fastest Clear: " + str(Global.score)


func start_game() -> void:
	if is_starting:
		return

	is_starting = true
	get_tree().call_deferred(
		"change_scene_to_file",
		"res://scenes/games.tscn"
	)


func _on_button_pressed() -> void:
	start_game()


func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("start_game"):
		start_game()
