
extends Node2D

var is_changing_scene := false
var car_scene: PackedScene = preload("res://scenes/carscene.tscn")
var score: int = 0



func request_scene_change(reason: String) -> void:
	if is_changing_scene:
		return


	is_changing_scene = true
	get_tree().call_deferred(
		"change_scene_to_file",
		"res://scenes/title.tscn"
	)


func _on_finish_area_body_entered(_body: Node2D) -> void:

	if Global.score == 0 or score < Global.score:
		Global.score = score

	request_scene_change("FINISH AREA")


func go_to_title(_body: Node2D) -> void:
	request_scene_change("CAR")



func _on_car_time_timeout() -> void:
	if is_changing_scene:
		return

	var car = car_scene.instantiate() as Area2D
	var pos_marker = $car_start_position.get_children().pick_random() as Marker2D

	car.position = $objects.to_local(pos_marker.global_position)
	$objects.add_child(car)

	car.body_entered.connect(go_to_title)





func _on_score_timer_timeout() -> void:
	if is_changing_scene:
		return

	score += 1
	$CanvasLayer/Label.text = "Fastest Time: " + str(score)
