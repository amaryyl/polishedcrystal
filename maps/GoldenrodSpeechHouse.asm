const_value set 2
	const GOLDENRODSPEECHHOUSE_LADY
	const GOLDENRODSPEECHHOUSE_TEACHER

GoldenrodSpeechHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

GoldenrodSpeechHouseLadyScript:
	jumptextfaceplayer GoldenrodSpeechHouseLadyText

GoldenrodSpeechHouseTeacherScript:
	jumptextfaceplayer GoldenrodSpeechHouseTeacherText

GoldenrodSpeechHouseLadyText:
	text "The Underground is"
	line "always so filthy."

	para "Some people have"
	line "no respect for"
	cont "others."
	done

GoldenrodSpeechHouseTeacherText:
	text "DJ Mary is so"
	line "cool. I listen to"

	para "her radio show"
	line "every day."
	done

GoldenrodSpeechHouse_MapEventHeader:
.Warps:
	db 2
	warp_def $7, $2, 21, GOLDENROD_CITY
	warp_def $7, $3, 21, GOLDENROD_CITY

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 2
	person_event SPRITE_LADY, 3, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, GoldenrodSpeechHouseLadyScript, -1
	person_event SPRITE_TEACHER, 2, 7, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, GoldenrodSpeechHouseTeacherScript, -1
