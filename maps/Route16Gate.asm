const_value set 2
	const ROUTE16GATE_OFFICER

Route16Gate_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

Route16GateOfficerScript:
	jumptextfaceplayer Route16GateOfficerText
	end

Route16GateOfficerText:
	text "Route 16 is a bit"
	line "untamed."

	para "You'll need HM"
	line "moves to get"
	cont "through."
	done

Route16Gate_MapEventHeader:
.Warps:
	db 4
	warp_def $4, $0, 2, ROUTE_16_NORTHWEST
	warp_def $5, $0, 3, ROUTE_16_NORTHWEST
	warp_def $4, $9, 3, ROUTE_16_NORTHEAST
	warp_def $5, $9, 4, ROUTE_16_NORTHEAST

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 1
	person_event SPRITE_OFFICER, 1, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route16GateOfficerScript, -1
