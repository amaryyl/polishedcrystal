const_value set 2
	const CELADONHOTELROOM3_GRAMPS

CeladonHotelRoom3_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

CeladonHotelRoom3GrampsScript:
	jumptextfaceplayer CeladonHotelRoom3GrampsText

CeladonHotelRoom3GrampsText:
	text "I've been staying"
	line "at this hotel"
	cont "every year since"
	cont "I was a wee lad."

	para "It almost feels"
	line "like a second"
	cont "home!"
	done

CeladonHotelRoom3_MapEventHeader:
.Warps:
	db 2
	warp_def $5, $3, 4, CELADON_HOTEL_2F
	warp_def $5, $4, 4, CELADON_HOTEL_2F

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 1
	person_event SPRITE_GRAMPS, 2, 2, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, CeladonHotelRoom3GrampsScript, -1
