const_value set 2
	const VERMILIONPOLLUTIONSPEECHHOUSE_BREEDER
	const VERMILIONPOLLUTIONSPEECHHOUSE_COOLTRAINER_M

VermilionPollutionSpeechHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

VermilionPollutionSpeechHouseBreederScript:
	jumptextfaceplayer VermilionPollutionSpeechHouseBreederText

VermilionPollutionSpeechHouseCooltrainerMScript:
	jumptextfaceplayer VermilionPollutionSpeechHouseCooltrainerMText

VermilionPollutionSpeechHouseBreederText:
	text "Vermilion is a"
	line "wonderful place,"

	para "but in a port like"
	line "this we have to be"
	cont "wary of pollution!"
	done

VermilionPollutionSpeechHouseCooltrainerMText:
	text "Thanks to the all"
	line "the cruise ships"
	cont "that come and go,"

	para "we get visitors"
	line "from all over!"
	done

VermilionPollutionSpeechHouse_MapEventHeader:
.Warps:
	db 2
	warp_def $7, $2, 13, VERMILION_CITY
	warp_def $7, $3, 13, VERMILION_CITY

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 2
	person_event SPRITE_BREEDER, 4, 1, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, VermilionPollutionSpeechHouseBreederScript, -1
	person_event SPRITE_COOLTRAINER_M, 3, 5, SPRITEMOVEDATA_STANDING_LEFT, 1, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, VermilionPollutionSpeechHouseCooltrainerMScript, -1
