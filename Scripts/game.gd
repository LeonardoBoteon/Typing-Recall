extends Control


var themes = {
	"Tema: Imagem": ["casa", "carro", "livro"],
	"Tema: Audio": ["maça", "banana", "laranja"],
	"Tema: Video": ["gato", "cachorro", "passaro"]
}

var words = []

var health = 3
var boss_max_health = 3
var boss_health = 3
var heart_full = preload("res://Assets/hud_heartFull.png")
var heart_empty = preload("res://Assets/hud_heartEmpty.png")

func _ready():
	$Tema.text = "%s" % Global.selected_theme
	$LineEdit.grab_focus()
	update_damage()
	update_health()

func update_health():
	if health == 3:
		$"HBoxContainer/3".texture = heart_full
		$"HBoxContainer/2".texture = heart_full
		$"HBoxContainer/1".texture = heart_full
	elif health == 2:
		$"HBoxContainer/3".texture = heart_empty
		$"HBoxContainer/2".texture = heart_full
		$"HBoxContainer/1".texture = heart_full
	elif health == 1:
		$"HBoxContainer/3".texture = heart_empty
		$"HBoxContainer/2".texture = heart_empty
		$"HBoxContainer/1".texture = heart_full

func update_damage():
	$TextureProgressBar.value = boss_health * 100 / boss_max_health

func _on_line_edit_text_submitted(new_text: String) -> void:
	if new_text in themes[Global.selected_theme] and (not (new_text in words)):
		boss_health -= 1
		$Damage.play()
		words.append(new_text)
		if health < 3:
			health += 1
		if boss_health <= 0:
			get_tree().change_scene_to_file("res://Scenes/WinScreen.tscn")
	if new_text in words:
		pass
	else:
		health -= 1
		$Hurt.play()
		if health <= 0:
			get_tree().change_scene_to_file("res://Scenes/LoseScreen.tscn")
	update_health()
	update_damage()
	$LineEdit.clear()
