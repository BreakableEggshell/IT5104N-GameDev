extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		call_deferred("_scene_reload")

func _scene_reload():
	get_tree().reload_current_scene()
