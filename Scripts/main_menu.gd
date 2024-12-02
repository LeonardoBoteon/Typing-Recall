extends Control

var selected_theme = ""


# Called when the node enters the scene tree for the first time.
func _ready():
	$Opcoes.add_item("Tema: Imagem")
	$Opcoes.add_item("Tema: Audio")
	$Opcoes.add_item("Tema: Video")

func _on_iniciar_pressed() -> void:
	Global.selected_theme = $Opcoes.text
	get_tree().change_scene_to_file("res://Scenes/Lore.tscn")

func _on_sair_pressed() -> void:
	get_tree().quit()


func _on_creditos_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Creditos.tscn")
