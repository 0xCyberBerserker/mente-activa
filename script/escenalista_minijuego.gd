extends Control

const MATCH_SCENE_PATH := "res://Escena/minijuegos/MatchDayAndDay.tscn"
const REFRAN_SCENE_PATH := "res://Escena/minijuegos/CompletaelRefrán.tscn"


func _on_mg_1_pressed() -> void:
	_change_scene(MATCH_SCENE_PATH)


func _on_mg_2_pressed() -> void:
	_change_scene(REFRAN_SCENE_PATH)


func _on_volver_pressed() -> void:
	_change_scene("res://Escena/control.tscn")


func _change_scene(scene_path: String) -> void:
	release_focus()
	get_tree().change_scene_to_file(scene_path)
