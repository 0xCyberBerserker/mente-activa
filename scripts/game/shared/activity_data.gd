extends RefCounted
class_name ActivityData

const AppRoutes = preload("res://scripts/game/shared/app_routes.gd")

const FALLBACK_PAIRS := [
	{"left": "Café", "right": "Desayuno", "category": "rutina"},
	{"left": "Llave", "right": "Puerta", "category": "hogar"},
	{"left": "Jabón", "right": "Manos", "category": "higiene"},
	{"left": "Paraguas", "right": "Lluvia", "category": "clima"},
	{"left": "Cepillo", "right": "Pelo", "category": "higiene"},
	{"left": "Almohada", "right": "Dormir", "category": "descanso"},
	{"left": "Plato", "right": "Comida", "category": "mesa"},
	{"left": "Zapato", "right": "Pie", "category": "ropa"},
	{"left": "Libro", "right": "Leer", "category": "lectura"},
	{"left": "Vaso", "right": "Agua", "category": "rutina"},
]

const FALLBACK_PROVERBS := [
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


static func load_pairs_catalog() -> Array[Dictionary]:
	var payload := _read_json(AppRoutes.PAIRS_DATA)
	if payload is Dictionary and payload.get("pairs") is Array:
		var pairs := _normalize_pairs(payload["pairs"])
		if not pairs.is_empty():
			return pairs
	return FALLBACK_PAIRS.duplicate(true)


static func load_proverb_questions() -> Array[Dictionary]:
	var payload := _read_json(AppRoutes.PROVERBS_DATA)
	if payload is Dictionary and payload.get("questions") is Array:
		var questions := _normalize_questions(payload["questions"])
		if not questions.is_empty():
			return questions
	return FALLBACK_PROVERBS.duplicate(true)


static func _read_json(path: String) -> Variant:
	if not FileAccess.file_exists(path):
		return null
	var file := FileAccess.open(path, FileAccess.READ)
	if file == null:
		return null
	return JSON.parse_string(file.get_as_text())


static func _normalize_pairs(items: Array) -> Array[Dictionary]:
	var pairs: Array[Dictionary] = []
	for item in items:
		if item is not Dictionary:
			continue
		var left := str(item.get("left", "")).strip_edges()
		var right := str(item.get("right", "")).strip_edges()
		if left.is_empty() or right.is_empty():
			continue
		pairs.append({
			"left": left,
			"right": right,
			"category": str(item.get("category", "")),
		})
	return pairs


static func _normalize_questions(items: Array) -> Array[Dictionary]:
	var questions: Array[Dictionary] = []
	for item in items:
		if item is not Dictionary:
			continue
		var prompt := str(item.get("prompt", "")).strip_edges()
		var options := item.get("options", [])
		var answer := int(item.get("answer", -1))
		if prompt.is_empty() or options is not Array or options.size() < 2:
			continue
		if answer < 0 or answer >= options.size():
			continue
		questions.append({
			"prompt": prompt,
			"options": options.duplicate(),
			"answer": answer,
		})
	return questions
