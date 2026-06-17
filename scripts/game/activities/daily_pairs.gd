extends Control

<<<<<<< HEAD:script/match_day_and_day.gd
const MENU_SCENE_PATH := "res://scene/EscenalistaMinijuego.tscn"
=======
const AppRoutes = preload("res://scripts/game/shared/app_routes.gd")
const AppText = preload("res://scripts/game/shared/app_text.gd")
const ActivityData = preload("res://scripts/game/shared/activity_data.gd")

>>>>>>> 65bf5b792163f8266e0731f68c120d3dc97a67d0:scripts/game/activities/daily_pairs.gd
const BACK_CARD_TEXT := "?"
const PAIRS_PER_GAME := 6

@onready var title_label: Label = $MarginContainer/Card/Content/Header/TitleLabel
@onready var matches_label: Label = $MarginContainer/Card/Content/Header/MatchesLabel
@onready var feedback_label: Label = $MarginContainer/Card/Content/FeedbackLabel
@onready var instructions_label: Label = $MarginContainer/Card/Content/InstructionsLabel
@onready var margin_container: MarginContainer = $MarginContainer
@onready var grid_container: GridContainer = $MarginContainer/Card/Content/GridContainer
@onready var back_button: Button = $MarginContainer/Card/Content/Footer/BackButton
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
var _pairs_catalog: Array[Dictionary] = []
var _pairs_per_round := PAIRS_PER_GAME


func _ready() -> void:
	get_viewport().size_changed.connect(_apply_responsive_layout)
	for index in card_buttons.size():
		card_buttons[index].pressed.connect(_on_card_pressed.bind(index))

	_apply_copy()
	_apply_responsive_layout()
	_setup_game()


func _setup_game() -> void:
	_pairs_catalog = ActivityData.load_pairs_catalog()
	_pairs_per_round = mini(PAIRS_PER_GAME, _pairs_catalog.size())
	_deck.clear()
	_selected_indices.clear()
	_matched_indices.clear()
	_matched_pair_ids.clear()
	_is_resolving = false

	var available_pairs: Array = _pairs_catalog.duplicate(true)
	available_pairs.shuffle()
	var selected_pairs: Array = available_pairs.slice(0, _pairs_per_round)

	for pair_index in selected_pairs.size():
		var pair: Dictionary = selected_pairs[pair_index]
		for text in [pair.get("left", ""), pair.get("right", "")]:
			_deck.append({
				"pair_id": pair_index,
				"text": text,
			})

	_deck.shuffle()
	feedback_label.text = ""
	feedback_label.modulate = Color(0.18, 0.24, 0.28, 1.0)
	instructions_label.text = AppText.DAILY_PAIRS.instructions
	restart_button.text = AppText.DAILY_PAIRS.restart_button
	_update_matches_label()
	_refresh_board()


func _refresh_board() -> void:
	for index in card_buttons.size():
		var button := card_buttons[index]
		button.modulate = Color.WHITE
		button.remove_theme_color_override("font_color")
		button.remove_theme_color_override("font_disabled_color")

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


func _apply_responsive_layout() -> void:
	var viewport_size := get_viewport_rect().size
	var width := viewport_size.x
	margin_container.offset_left = 18.0 if width < 720.0 else 72.0
	margin_container.offset_top = 18.0 if width < 720.0 else 48.0
	margin_container.offset_right = -18.0 if width < 720.0 else -72.0
	margin_container.offset_bottom = -18.0 if width < 720.0 else -48.0
	grid_container.columns = 2 if width < 720.0 else 3 if width < 1080.0 else 4
	for button in card_buttons:
		button.custom_minimum_size.y = 96.0 if width < 720.0 else 88.0


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
		feedback_label.text = AppText.DAILY_PAIRS.match_feedback
		feedback_label.modulate = Color(0.11, 0.49, 0.2, 1.0)
		instructions_label.text = AppText.DAILY_PAIRS.next_hint
		_selected_indices.clear()
		_update_matches_label()
		_is_resolving = false
		_refresh_board()

		if _matched_indices.size() == _deck.size():
			feedback_label.text = AppText.DAILY_PAIRS.finished_feedback
			feedback_label.modulate = Color(0.15, 0.24, 0.55, 1.0)
			instructions_label.text = AppText.DAILY_PAIRS.finished_hint
			restart_button.text = AppText.DAILY_PAIRS.play_again_button
	else:
		feedback_label.text = AppText.DAILY_PAIRS.retry_feedback
		feedback_label.modulate = Color(0.69, 0.15, 0.15, 1.0)
		instructions_label.text = AppText.DAILY_PAIRS.instructions
		_refresh_board()
		await get_tree().create_timer(0.9).timeout
		_selected_indices.clear()
		_is_resolving = false
		_refresh_board()


func _update_matches_label() -> void:
	matches_label.text = AppText.DAILY_PAIRS.matches_label % [_matched_indices.size() / 2, _pairs_per_round]


func _on_restart_pressed() -> void:
	_setup_game()
	card_buttons[0].grab_focus()


func _on_back_pressed() -> void:
	release_focus()
	get_tree().change_scene_to_file(AppRoutes.ACTIVITY_SELECT_SCENE)


func _apply_copy() -> void:
	title_label.text = AppText.DAILY_PAIRS.title
	instructions_label.text = AppText.DAILY_PAIRS.instructions
	back_button.text = AppText.DAILY_PAIRS.back_button
	restart_button.text = AppText.DAILY_PAIRS.restart_button
	back_button.focus_neighbor_right = restart_button.get_path()
	restart_button.focus_neighbor_left = back_button.get_path()
