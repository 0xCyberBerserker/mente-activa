extends Control

const AppRoutes = preload("res://scripts/game/shared/app_routes.gd")
const AppText = preload("res://scripts/game/shared/app_text.gd")

@onready var title_label: Label = $MarginContainer/Content/BrandBlock/TitleLabel
@onready var subtitle_label: Label = $MarginContainer/Content/BrandBlock/SubtitleLabel
@onready var margin_container: MarginContainer = $MarginContainer
@onready var actions: VBoxContainer = $MarginContainer/Content/Actions
@onready var start_button: Button = $MarginContainer/Content/Actions/StartButton
@onready var exit_button: Button = $MarginContainer/Content/Actions/ExitButton


func _ready() -> void:
	get_viewport().size_changed.connect(_apply_responsive_layout)
	title_label.text = AppText.MAIN_MENU.title
	subtitle_label.text = AppText.MAIN_MENU.subtitle
	start_button.text = AppText.MAIN_MENU.start_button
	exit_button.text = AppText.MAIN_MENU.exit_button
	_apply_responsive_layout()
	start_button.grab_focus()


func _apply_responsive_layout() -> void:
	var viewport_size := get_viewport_rect().size
	var compact_layout := viewport_size.x < 900.0
	margin_container.offset_left = 32.0 if compact_layout else 96.0
	margin_container.offset_top = 28.0 if compact_layout else 72.0
	margin_container.offset_right = -32.0 if compact_layout else -96.0
	margin_container.offset_bottom = -28.0 if compact_layout else -72.0
	actions.custom_minimum_size.x = 0.0 if compact_layout else 420.0
	start_button.custom_minimum_size.y = 84.0 if compact_layout else 92.0
	exit_button.custom_minimum_size.y = 72.0 if compact_layout else 80.0


func _on_start_pressed() -> void:
	release_focus()
	get_tree().change_scene_to_file(AppRoutes.ACTIVITY_SELECT_SCENE)


func _on_exit_pressed() -> void:
	release_focus()
	get_tree().quit()
