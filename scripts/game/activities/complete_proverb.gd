extends Control

const AppRoutes = preload("res://scripts/game/shared/app_routes.gd")
const AppText = preload("res://scripts/game/shared/app_text.gd")
const ActivityData = preload("res://scripts/game/shared/activity_data.gd")

# Refranes can work well for older adults or people familiar with popular language,
# but may be less suitable for every neurodevelopment profile or cultural context.

@onready var title_label: Label = $MarginContainer/Card/Content/Header/TitleLabel
@onready var score_label: Label = $MarginContainer/Card/Content/Header/ScoreLabel
@onready var progress_label: Label = $MarginContainer/Card/Content/ProgressLabel
@onready var prompt_label: Label = $MarginContainer/Card/Content/PromptLabel
@onready var feedback_label: Label = $MarginContainer/Card/Content/FeedbackLabel
@onready var margin_container: MarginContainer = $MarginContainer
@onready var next_button: Button = $MarginContainer/Card/Content/Footer/NextButton
@onready var back_button: Button = $MarginContainer/Card/Content/Footer/BackButton
@onready var option_buttons: Array[Button] = [
	$MarginContainer/Card/Content/Options/OptionA,
	$MarginContainer/Card/Content/Options/OptionB,
	$MarginContainer/Card/Content/Options/OptionC,
]

var _questions: Array[Dictionary] = []
var _current_question := 0
var _score := 0
var _has_answered := false
var _showing_results := false


func _ready() -> void:
	get_viewport().size_changed.connect(_apply_responsive_layout)
	_questions = ActivityData.load_proverb_questions()
	_apply_copy()
	_apply_responsive_layout()
	_show_question()


func _show_question() -> void:
	var question: Dictionary = _questions[_current_question]
	var options: Array = question["options"]

	progress_label.text = AppText.PROVERBS.progress_label % [_current_question + 1, _questions.size()]
	score_label.text = AppText.PROVERBS.score_label % [_score, _questions.size()]
	prompt_label.text = question["prompt"]
	feedback_label.text = ""
	next_button.disabled = true
	next_button.text = AppText.PROVERBS.next_button if _current_question < _questions.size() - 1 else AppText.PROVERBS.result_button
	_has_answered = false
	_showing_results = false

	for index in option_buttons.size():
		var button := option_buttons[index]
		button.disabled = false
		button.text = str(options[index])
		button.modulate = Color.WHITE
		if index == 0:
			button.grab_focus.call_deferred()


func _on_option_pressed(index: int) -> void:
	if _has_answered:
		return

	_has_answered = true
	var correct_index: int = _questions[_current_question]["answer"]
	var is_correct := index == correct_index

	if is_correct:
		_score += 1
		feedback_label.text = AppText.PROVERBS.correct_feedback
		feedback_label.modulate = Color(0.11, 0.49, 0.2, 1.0)
	else:
		feedback_label.text = AppText.PROVERBS.retry_feedback % option_buttons[correct_index].text
		feedback_label.modulate = Color(0.69, 0.15, 0.15, 1.0)

	for option_index in option_buttons.size():
		var button := option_buttons[option_index]
		button.disabled = true
		if option_index == correct_index:
			button.modulate = Color(0.8, 1.0, 0.8, 1.0)
		elif option_index == index and not is_correct:
			button.modulate = Color(1.0, 0.8, 0.8, 1.0)

	score_label.text = AppText.PROVERBS.score_label % [_score, _questions.size()]
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

	if _current_question >= _questions.size() - 1:
		_show_results()
		return

	_current_question += 1
	_show_question()


func _show_results() -> void:
	progress_label.text = AppText.PROVERBS.finished_progress
	prompt_label.text = AppText.PROVERBS.finished_prompt
	feedback_label.text = AppText.PROVERBS.finished_feedback % [_score, _questions.size()]
	feedback_label.modulate = Color(0.15, 0.24, 0.55, 1.0)
	next_button.text = AppText.PROVERBS.play_again_button
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
	release_focus()
	get_tree().change_scene_to_file(AppRoutes.ACTIVITY_SELECT_SCENE)


func _notification(what: int) -> void:
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		get_tree().quit()


func _apply_copy() -> void:
	title_label.text = AppText.PROVERBS.title
	score_label.text = AppText.PROVERBS.score_label % [0, max(_questions.size(), 1)]
	progress_label.text = AppText.PROVERBS.progress_label % [1, max(_questions.size(), 1)]
	prompt_label.text = AppText.PROVERBS.loading_prompt
	next_button.text = AppText.PROVERBS.next_button
	back_button.text = AppText.PROVERBS.back_button


func _apply_responsive_layout() -> void:
	var width := get_viewport_rect().size.x
	margin_container.offset_left = 18.0 if width < 720.0 else 72.0
	margin_container.offset_top = 18.0 if width < 720.0 else 48.0
	margin_container.offset_right = -18.0 if width < 720.0 else -72.0
	margin_container.offset_bottom = -18.0 if width < 720.0 else -48.0
	for button in option_buttons:
		button.custom_minimum_size.y = 90.0 if width < 720.0 else 78.0
