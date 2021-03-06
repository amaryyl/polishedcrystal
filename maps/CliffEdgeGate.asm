const_value set 2
	const CLIFFEDGEGATE_RECEPTIONIST
	const CLIFFEDGEGATE_SCIENTIST
	const CLIFFEDGEGATE_ROCKET

CliffEdgeGate_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

CliffEdgeGateReceptionistScript:
	jumptextfaceplayer CliffEdgeGateReceptionistText

ProfOaksAide3Script:
	faceplayer
	opentext
	checkevent EVENT_GOT_MACHO_BRACE_FROM_PROF_OAKS_AIDE
	iftrue .Explain
	writetext ProfOaksAide3HiText
	waitbutton
	count_seen_caught
	checkcode VAR_DEXCAUGHT
	if_greater_than 44, .HereYouGo
.UhOh
	writetext ProfOaksAide3UhOhText
	waitbutton
	closetext
	end

.HereYouGo
	writetext ProfOaksAide3HereYouGoText
	waitbutton
	verbosegiveitem MACHO_BRACE
	iffalse .NoRoom
	setevent EVENT_GOT_MACHO_BRACE_FROM_PROF_OAKS_AIDE
.Explain
	writetext ProfOaksAide3ExplainText
	waitbutton
	closetext
	end

.NoRoom
	writetext ProfOaksAide3NoRoomText
	waitbutton
	closetext
	end

TrainerGruntM12:
	trainer EVENT_BEAT_ROCKET_GRUNTM_12, GRUNTM, 12, GruntM12SeenText, GruntM12BeatenText, 0, GruntM12Script

GruntM12Script:
	end_if_just_battled
	opentext
	writetext GruntM12AfterText
	waitbutton
	closetext
	end

CliffEdgeGateHiddenBigPearl:
	dwb EVENT_CLIFF_EDGE_GATE_HIDDEN_BIG_PEARL, BIG_PEARL

CliffEdgeGateReceptionistText:
	text "Yellow Forest is"
	line "this way!"

	para "It's a popular"
	line "tourist sight!"
	done

ProfOaksAide3HiText:
	text "Hello there! I'm"
	line "Prof.Oak's aide."

	para "If you caught 45"
	line "kinds of #mon,"

	para "I'm supposed to"
	line "give you an item."

	para "So, <PLAYER>,"
	line "have you caught"

	para "at least 45 kinds"
	line "of #mon?"
	done

ProfOaksAide3UhOhText:
	text "Let's see…"
	line "Uh-oh! You've only"

	para "caught @"
	deciram wd003, 1, 3
	text " kinds"
	line "of #mon."

	para "Come back and see"
	line "me when you catch"
	cont "45 kinds."
	done

ProfOaksAide3HereYouGoText:
	text "Let's see…"
	line "Great job! You've"

	para "caught @"
	deciram wd003, 1, 3
	text " kinds"
	line "of #mon."

	para "Congratulations!"
	line "Here you go!"
	done

ProfOaksAide3NoRoomText:
	text "Oh! I see you"
	line "don't have any"
	cont "room for this."
	done

ProfOaksAide3ExplainText:
	text "That Macho Brace"
	line "helps a #mon"

	para "grow more from"
	line "battling, but"
	cont "slows it down."

	para "According to"
	line "Prof.Elm, some"
	cont "#mon evolve"

	para "when one stat has"
	line "grown enough."

	para "Use it to com-"
	line "plete the #dex!"
	done

GruntM12SeenText:
	text "You're curious"
	line "about our plans?"

	para "Beat me and I'll"
	line "tell you!"
	done

GruntM12BeatenText:
	text "You were supposed"
	line "to lose!"
	done

GruntM12AfterText:
	text "Yellow Forest is"
	line "full of rare"
	cont "#mon."

	para "We're nabbing them"
	line "all for ourselves!"
	done

CliffEdgeGate_MapEventHeader:
.Warps:
	db 2
	warp_def $13, $11, 8, CIANWOOD_CITY
	warp_def $13, $3, 1, ROUTE_47

.XYTriggers:
	db 0

.Signposts:
	db 1
	signpost 6, 17, SIGNPOST_ITEM, CliffEdgeGateHiddenBigPearl

.PersonEvents:
	db 3
	person_event SPRITE_RECEPTIONIST, 16, 11, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, CliffEdgeGateReceptionistScript, EVENT_YELLOW_FOREST_ROCKET_TAKEOVER
	person_event SPRITE_SCIENTIST, 4, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ProfOaksAide3Script, EVENT_YELLOW_FOREST_ROCKET_TAKEOVER
	person_event SPRITE_ROCKET, 16, 17, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_TRAINER, 3, TrainerGruntM12, EVENT_CLEARED_YELLOW_FOREST
