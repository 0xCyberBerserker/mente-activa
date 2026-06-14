extends RefCounted
class_name AppText

const MAIN_MENU := {
	"title": "Mente Activa",
	"subtitle": "Actividades cortas de memoria, lenguaje y atención.",
	"start_button": "Empezar",
	"exit_button": "Salir",
}

const ACTIVITY_SELECT := {
	"title": "Elige una actividad",
	"description": "Actividades cortas, sin límite de tiempo.",
	"pairs_button": "Parejas cotidianas",
	"proverbs_button": "Lenguaje: refranes",
	"back_button": "Volver",
}

const DAILY_PAIRS := {
	"title": "Parejas cotidianas",
	"instructions": "Busca dos elementos que vayan juntos.",
	"matches_label": "Parejas: %d/%d",
	"back_button": "Volver",
	"restart_button": "Reiniciar",
	"play_again_button": "Jugar otra vez",
	"match_feedback": "✓ Bien. Esta pareja ya está completa.",
	"next_hint": "Ahora puedes buscar otra pareja.",
	"retry_feedback": "Casi. Prueba con otra pareja.",
	"finished_feedback": "✓ Has completado todas las parejas.",
	"finished_hint": "Actividad terminada.",
}

const PROVERBS := {
	"title": "Lenguaje: refranes",
	"score_label": "Puntuación: %d/%d",
	"progress_label": "Pregunta %d de %d",
	"next_button": "Siguiente",
	"result_button": "Ver resultado",
	"play_again_button": "Jugar otra vez",
	"back_button": "Volver",
	"loading_prompt": "Cargando refrán...",
	"correct_feedback": "✓ Bien.",
	"retry_feedback": "Casi. La respuesta era: %s",
	"finished_progress": "Actividad terminada",
	"finished_prompt": "Has completado la actividad.",
	"finished_feedback": "Resultado final: %d de %d aciertos.",
}
