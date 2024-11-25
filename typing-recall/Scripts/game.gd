extends Control


var themes = {
	"Tema 1": ["casa", "carro", "livro"],
	"Tema 2": ["maçã", "banana", "laranja"],
	"Tema 3": ["gato", "cachorro", "pássaro"]
}

var score = 0
var health = 3
var win_score = 10

func _ready():
	$Tema.text = "Tema: %s" % Global.selected_theme
	update_labels()

func update_labels():
	$Pontuacao.text = "Pontuação: %d" % score
	$Saude.text = "Saúde: %d" % health


func _on_line_edit_text_submitted(new_text: String) -> void:
	if new_text in themes[Global.selected_theme]:
		score += 1
		if health < 3:
			health += 1
		if score >= win_score:
			get_tree().change_scene_to_file("res://Scenes/WinScreen.tscn")
	else:
		health -= 1
		if health <= 0:
			get_tree().change_scene_to_file("res://Scenes/LoseScreen.tscn")
	update_labels()
	$LineEdit.clear()
