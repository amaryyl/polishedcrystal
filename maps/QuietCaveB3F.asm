const_value set 2
	const QUIETCAVEB3F_MARLEY
	const QUIETCAVEB3F_POKE_BALL

QuietCaveB3F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

QuietCaveB3FMarleyScript:
	faceplayer
	checkevent EVENT_BEAT_MARLEY
	iftrue .Beaten
	opentext
	writetext .ChallengeText
	yesorno
	iffalse .No
	writetext .YesText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked QUIETCAVEB3F_MARLEY
	loadtrainer MARLEY, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_MARLEY
.Beaten
	opentext
	writetext .ItemText
	buttonsound
	verbosegiveitem POWER_ANKLET
	iffalse .Done
	writetext .GoodbyeText
	waitbutton
	closetext
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear QUIETCAVEB3F_MARLEY
	pause 15
	special Special_FadeInQuickly
	clearevent EVENT_BATTLE_TOWER_MARLEY
	end

.Done:
	closetext
	end

.No:
	writetext .NoText
	waitbutton
	closetext
	end

.ChallengeText:
	text "…I'm Marley."
	line "…You are?"

	para "Oh… <PLAYER>,"
	line "will you battle"
	cont "me, please?"
	done

.YesText:
	text "…OK. I'll do my"
	line "best."
	done

.NoText:
	text "…Too bad…"
	done

.BeatenText:
	text "…Awww."
	done

.ItemText:
	text "I… I don't like to"
	line "talk…"

	para "I choose my words"
	line "carefully, but"

	para "they may still"
	line "hurt someone acci-"
	cont "dentally…"

	para "So, I'll have to"
	line "convey thanks an-"
	cont "other way…"
	done

.GoodbyeText:
	text "…I appreciate your"
	line "battling with me…"
	cont "…Just a little…"

	para "I'm going to"
	line "Battle Tower…"

	para "Bye-bye…"
	done

QuietCaveB3FTMFocusBlast:
	tmhmball TM_FOCUS_BLAST

QuietCaveB3FHiddenPPUp:
	dwb EVENT_QUIET_CAVE_B3F_HIDDEN_PP_UP, PP_UP

QuietCaveB3FHiddenMaxRevive
	dwb EVENT_QUIET_CAVE_B3F_HIDDEN_MAX_REVIVE, MAX_REVIVE

QuietCaveB3F_MapEventHeader:
.Warps:
	db 4
	warp_def $1f, $8, 5, QUIET_CAVE_B2F ; hole
	warp_def $7, $21, 6, QUIET_CAVE_B2F
	warp_def $9, $f, 4, QUIET_CAVE_B3F
	warp_def $b, $5, 3, QUIET_CAVE_B3F

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 20, 16, SIGNPOST_ITEM, QuietCaveB3FHiddenPPUp
	signpost 22, 12, SIGNPOST_ITEM, QuietCaveB3FHiddenMaxRevive

.PersonEvents:
	db 2
	person_event SPRITE_MARLEY, 5, 5, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, 0, PERSONTYPE_SCRIPT, 0, QuietCaveB3FMarleyScript, EVENT_QUIET_CAVE_MARLEY
	person_event SPRITE_BALL_CUT_FRUIT, 22, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TMHMBALL, 0, QuietCaveB3FTMFocusBlast, EVENT_QUIET_CAVE_B3F_TM_FOCUS_BLAST
