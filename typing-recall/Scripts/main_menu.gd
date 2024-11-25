extends Control

var selected_theme = ""


# Called when the node enters the scene tree for the first time.
func _ready():
	$Opcoes.add_item("Tema 1")
	$Opcoes.add_item("Tema 2")
	$Opcoes.add_item("Tema 3")

func _on_iniciar_pressed() -> void:
	Global.selected_theme = $Opcoes.text
	get_tree().change_scene_to_file("res://Scenes/Game.tscn")

func _on_sair_pressed() -> void:
	get_tree().quit()
