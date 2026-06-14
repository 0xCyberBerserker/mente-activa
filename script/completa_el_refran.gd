extends Control

const MENU_SCENE_PATH := "res://Escena/EscenalistaMinijuego.tscn"

# Refranes can work well for older adults or people familiar with popular language,
# but may be less suitable for every neurodevelopment profile or cultural context.
const QUESTIONS := [
	{
		"prompt": "A quien madruga...",
		"options": ["mucho abarca", "Dios le ayuda", "todo se le escapa"],
		"answer": 1,
	},
	{
		"prompt": "Más vale pájaro en mano...",
		"options": ["que ciento volando", "que dormir temprano", "si el río suena"],
		"answer": 0,
	},
	{
		"prompt": "En boca cerrada...",
		"options": ["no entran moscas", "caben dos refranes", "todo es ganancia"],
		"answer": 0,
	},
	{
		"prompt": "No dejes para mañana...",
		"options": ["lo que puedas vender", "lo que puedas callar", "lo que puedas hacer hoy"],
		"answer": 2,
	},
	{
		"prompt": "El que mucho abarca...",
		"options": ["poco aprieta", "más temprano llega", "menos tropieza"],
		"answer": 0,
	},
]

@onready var score_label: Label = $MarginContainer/Card/Content/Header/ScoreLabel
@onready var progress_label: Label = $MarginContainer/Card/Content/ProgressLabel
@onready var prompt_label: Label = $MarginContainer/Card/Content/PromptLabel
@onready var feedback_label: Label = $MarginContainer/Card/Content/FeedbackLabel
@onready var next_button: Button = $MarginContainer/Card/Content/Footer/NextButton
@onready var option_buttons: Array[Button] = [
	$MarginContainer/Card/Content/Options/OptionA,
	$MarginContainer/Card/Content/Options/OptionB,
	$MarginContainer/Card/Content/Options/OptionC,
]

var _current_question := 0
var _score := 0
var _has_answered := false
var _showing_results := false


func _ready() -> void:
	_show_question()


func _show_question() -> void:
	var question: Dictionary = QUESTIONS[_current_question]
	var options: Array = question["options"]

	progress_label.text = "Pregunta %d de %d" % [_current_question + 1, QUESTIONS.size()]
	score_label.text = "Puntuación: %d/%d" % [_score, QUESTIONS.size()]
	prompt_label.text = question["prompt"]
	feedback_label.text = ""
	next_button.disabled = true
	next_button.text = "Siguiente" if _current_question < QUESTIONS.size() - 1 else "Ver resultado"
	_has_answered = false
	_showing_results = false

	for index in option_buttons.size():
		var button := option_buttons[index]
		button.disabled = false
		button.text = str(options[index])
		button.modulate = Color.WHITE


func _on_option_pressed(index: int) -> void:
	if _has_answered:
		return

	_has_answered = true
	var correct_index: int = QUESTIONS[_current_question]["answer"]
	var is_correct := index == correct_index

	if is_correct:
		_score += 1
		feedback_label.text = "✓ Bien."
		feedback_label.modulate = Color(0.11, 0.49, 0.2, 1.0)
	else:
		feedback_label.text = "Casi. La respuesta era: %s" % option_buttons[correct_index].text
		feedback_label.modulate = Color(0.69, 0.15, 0.15, 1.0)

	for option_index in option_buttons.size():
		var button := option_buttons[option_index]
		button.disabled = true
		if option_index == correct_index:
			button.modulate = Color(0.8, 1.0, 0.8, 1.0)
		elif option_index == index and not is_correct:
			button.modulate = Color(1.0, 0.8, 0.8, 1.0)

	score_label.text = "Puntuación: %d/%d" % [_score, QUESTIONS.size()]
	next_button.disabled = false


func _on_option_a_pressed() -> void:
	_on_option_pressed(0)


func _on_option_b_pressed() -> void:
	_on_option_pressed(1)


func _on_option_c_pressed() -> void:
	_on_option_pressed(2)


func _on_next_pressed() -> void:
	if _showing_results:
		_restart_game()
		return

	if not _has_answered:
		return

	if _current_question >= QUESTIONS.size() - 1:
		_show_results()
		return

	_current_question += 1
	_show_question()


func _show_results() -> void:
	progress_label.text = "Juego terminado"
	prompt_label.text = "Has completado el minijuego."
	feedback_label.text = "Resultado final: %d de %d aciertos." % [_score, QUESTIONS.size()]
	feedback_label.modulate = Color(0.15, 0.24, 0.55, 1.0)
	next_button.text = "Jugar otra vez"
	next_button.disabled = false
	_has_answered = true
	_showing_results = true

	for button in option_buttons:
		button.disabled = true
		button.modulate = Color.WHITE


func _restart_game() -> void:
	_current_question = 0
	_score = 0
	_show_question()


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file(MENU_SCENE_PATH)


func _notification(what: int) -> void:
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		get_tree().quit()
