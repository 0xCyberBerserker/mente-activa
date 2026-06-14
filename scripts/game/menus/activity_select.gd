extends Control

const AppRoutes = preload("res://scripts/game/shared/app_routes.gd")
const AppText = preload("res://scripts/game/shared/app_text.gd")

@onready var title_label: Label = $MarginContainer/Card/Content/TitleLabel
@onready var description_label: Label = $MarginContainer/Card/Content/DescriptionLabel
@onready var margin_container: MarginContainer = $MarginContainer
@onready var actions: VBoxContainer = $MarginContainer/Card/Content/Actions
@onready var daily_pairs_button: Button = $MarginContainer/Card/Content/Actions/DailyPairsButton
@onready var proverbs_button: Button = $MarginContainer/Card/Content/Actions/ProverbsButton
@onready var back_button: Button = $MarginContainer/Card/Content/Actions/BackButton


func _ready() -> void:
	get_viewport().size_changed.connect(_apply_responsive_layout)
	title_label.text = AppText.ACTIVITY_SELECT.title
	description_label.text = AppText.ACTIVITY_SELECT.description
	daily_pairs_button.text = AppText.ACTIVITY_SELECT.pairs_button
	proverbs_button.text = AppText.ACTIVITY_SELECT.proverbs_button
	back_button.text = AppText.ACTIVITY_SELECT.back_button
	_apply_responsive_layout()
	daily_pairs_button.grab_focus()


func _apply_responsive_layout() -> void:
	var viewport_size := get_viewport_rect().size
	var compact_layout := viewport_size.x < 900.0
	margin_container.offset_left = 24.0 if compact_layout else 72.0
	margin_container.offset_top = 24.0 if compact_layout else 52.0
	margin_container.offset_right = -24.0 if compact_layout else -72.0
	margin_container.offset_bottom = -24.0 if compact_layout else -52.0
	actions.add_theme_constant_override("separation", 18 if compact_layout else 24)
	daily_pairs_button.custom_minimum_size.y = 80.0 if compact_layout else 86.0
	proverbs_button.custom_minimum_size.y = 80.0 if compact_layout else 86.0
	back_button.custom_minimum_size.y = 70.0 if compact_layout else 76.0


func _on_mg_1_pressed() -> void:
	_change_scene(AppRoutes.DAILY_PAIRS_SCENE)


func _on_mg_2_pressed() -> void:
	_change_scene(AppRoutes.COMPLETE_PROVERB_SCENE)


func _on_volver_pressed() -> void:
	_change_scene(AppRoutes.MAIN_MENU_SCENE)


func _change_scene(scene_path: String) -> void:
	release_focus()
	get_tree().change_scene_to_file(scene_path)
