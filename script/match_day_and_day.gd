extends Control

const MENU_SCENE_PATH := "res://Escena/EscenalistaMinijuego.tscn"
const BACK_CARD_TEXT := "?"

const CARD_PAIRS := [
	["Cafe", "Desayuno"],
	["Llave", "Puerta"],
	["Jabon", "Manos"],
	["Paraguas", "Lluvia"],
	["Cepillo", "Pelo"],
	["Almohada", "Dormir"],
]

@onready var matches_label: Label = $MarginContainer/Card/Content/Header/MatchesLabel
@onready var feedback_label: Label = $MarginContainer/Card/Content/FeedbackLabel
@onready var instructions_label: Label = $MarginContainer/Card/Content/InstructionsLabel
@onready var restart_button: Button = $MarginContainer/Card/Content/Footer/RestartButton
@onready var card_buttons: Array[Button] = [
	$MarginContainer/Card/Content/GridContainer/Button1,
	$MarginContainer/Card/Content/GridContainer/Button2,
	$MarginContainer/Card/Content/GridContainer/Button3,
	$MarginContainer/Card/Content/GridContainer/Button4,
	$MarginContainer/Card/Content/GridContainer/Button5,
	$MarginContainer/Card/Content/GridContainer/Button6,
	$MarginContainer/Card/Content/GridContainer/Button7,
	$MarginContainer/Card/Content/GridContainer/Button8,
	$MarginContainer/Card/Content/GridContainer/Button9,
	$MarginContainer/Card/Content/GridContainer/Button10,
	$MarginContainer/Card/Content/GridContainer/Button11,
	$MarginContainer/Card/Content/GridContainer/Button12,
]

var _deck: Array[Dictionary] = []
var _selected_indices: Array[int] = []
var _matched_indices: Array[int] = []
var _matched_pair_ids: Array[int] = []
var _is_resolving := false


func _ready() -> void:
	for index in card_buttons.size():
		card_buttons[index].pressed.connect(_on_card_pressed.bind(index))

	_setup_game()


func _setup_game() -> void:
	_deck.clear()
	_selected_indices.clear()
	_matched_indices.clear()
	_matched_pair_ids.clear()
	_is_resolving = false

	for pair_index in CARD_PAIRS.size():
		var pair: Array = CARD_PAIRS[pair_index]
		for text in pair:
			_deck.append({
				"pair_id": pair_index,
				"text": text,
			})

	_deck.shuffle()
	feedback_label.text = ""
	feedback_label.modulate = Color(0.18, 0.24, 0.28, 1.0)
	instructions_label.text = "Selecciona dos cartas relacionadas entre sí."
	restart_button.text = "Reiniciar"
	_update_matches_label()
	_refresh_board()


func _refresh_board() -> void:
	for index in card_buttons.size():
		var button := card_buttons[index]
		button.modulate = Color.WHITE

		if index in _matched_indices:
			button.text = str(_deck[index]["text"])
			button.disabled = true
			button.add_theme_color_override("font_disabled_color", Color(0.16, 0.34, 0.18, 1.0))
			button.modulate = Color(0.88, 0.96, 0.88, 1.0)
		elif index in _selected_indices:
			button.text = str(_deck[index]["text"])
			button.disabled = _is_resolving
			button.add_theme_color_override("font_color", Color(0.1, 0.2, 0.32, 1.0))
			button.modulate = Color(0.86, 0.93, 1.0, 1.0)
		else:
			button.text = BACK_CARD_TEXT
			button.disabled = _is_resolving
			button.add_theme_color_override("font_color", Color(0.22, 0.28, 0.33, 1.0))
			button.add_theme_color_override("font_disabled_color", Color(0.22, 0.28, 0.33, 1.0))


func _on_card_pressed(index: int) -> void:
	if _is_resolving or index in _matched_indices or index in _selected_indices:
		return

	_selected_indices.append(index)
	_refresh_board()

	if _selected_indices.size() == 2:
		_resolve_selection()


func _resolve_selection() -> void:
	_is_resolving = true
	var first_card: Dictionary = _deck[_selected_indices[0]]
	var second_card: Dictionary = _deck[_selected_indices[1]]
	var pair_id: int = int(first_card["pair_id"])
	var is_match: bool = pair_id == int(second_card["pair_id"])

	if is_match:
		if pair_id in _matched_pair_ids:
			_selected_indices.clear()
			_is_resolving = false
			_refresh_board()
			return

		_matched_pair_ids.append(pair_id)
		_matched_indices.append_array(_selected_indices)
		feedback_label.text = "Pareja conseguida. Esa pareja ya queda cerrada."
		feedback_label.modulate = Color(0.11, 0.49, 0.2, 1.0)
		instructions_label.text = "Muy bien. Ahora busca otra pareja distinta."
		_selected_indices.clear()
		_update_matches_label()
		_is_resolving = false
		_refresh_board()

		if _matched_indices.size() == _deck.size():
			feedback_label.text = "Has completado todas las parejas."
			feedback_label.modulate = Color(0.15, 0.24, 0.55, 1.0)
			instructions_label.text = "Juego terminado."
			restart_button.text = "Jugar otra vez"
	else:
		feedback_label.text = "No forman pareja. Intenta otra vez."
		feedback_label.modulate = Color(0.69, 0.15, 0.15, 1.0)
		instructions_label.text = "Selecciona dos cartas relacionadas entre sí."
		_refresh_board()
		await get_tree().create_timer(0.9).timeout
		_selected_indices.clear()
		_is_resolving = false
		_refresh_board()


func _update_matches_label() -> void:
	matches_label.text = "Parejas: %d/%d" % [_matched_indices.size() / 2, CARD_PAIRS.size()]


func _on_restart_pressed() -> void:
	_setup_game()


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file(MENU_SCENE_PATH)
