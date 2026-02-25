extends Area2D

@export var next_scene : PackedScene

func _on_body_entered(body: CharacterBody2D) -> void:
	call_deferred("_go_to_next_scene")

func _go_to_next_scene():
	get_tree().change_scene_to_file("res://Scene/level_2.tscn")
