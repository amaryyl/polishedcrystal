const_value set 2
	const SHAMOUTIISLAND_FRUIT_TREE
	const SHAMOUTIISLAND_VILEPLUME
	const SHAMOUTIISLAND_YOUNGSTER
	const SHAMOUTIISLAND_MARILL
	const SHAMOUTIISLAND_FISHER1
	const SHAMOUTIISLAND_FISHER2

ShamoutiIsland_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ShamoutiIslandFruitTree:
	fruittree FRUITTREE_SHAMOUTI_ISLAND

ShamoutiIslandVileplumeScript:
	special SpecialSnorlaxAwake
	iftrue .Awake
	showemote EMOTE_SLEEP, SHAMOUTIISLAND_VILEPLUME, 15
	opentext
	writetext .VileplumeText
	waitbutton
	closetext
	end

.Awake:
	opentext
	writetext .PokeFluteText
	waitbutton
	closetext
	applymovement SHAMOUTIISLAND_VILEPLUME, .ShakeMovement
	opentext
	writetext .WokeUpText
	pause 15
	cry VILEPLUME
	closetext
	writecode VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	loadwildmon VILEPLUME, 60
	startbattle
	disappear SHAMOUTIISLAND_VILEPLUME
	reloadmapafterbattle
	end

.VileplumeText:
	text "Vileplume is fast"
	line "asleep…"
	done

.PokeFluteText:
	text "The #gear was"
	line "placed near the"

	para "sleeping Vile-"
	line "plume…"
	done

.WokeUpText:
	text "Vileplume woke up!"
	done

.ShakeMovement:
	tree_shake
	step_end

ShamoutiIslandYoungsterScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_ODD_SOUVENIR_FROM_PIKABLU_GUY
	iftrue .GotItem
	writetext .Text1
	buttonsound
	verbosegiveitem ODD_SOUVENIR
	iffalse .Done
	setevent EVENT_GOT_ODD_SOUVENIR_FROM_PIKABLU_GUY
.GotItem:
	writetext .Text2
	waitbutton
.Done:
	closetext
	end

.Text1:
	text "Hello again! Let"
	line "me give you that"
	cont "souvenir."
	done

.Text2:
	text "A shiny Pikachu"
	line "would be a real"
	cont "Pikablu."

	para "I've never found"
	line "one, but I'm happy"
	cont "with my Marill."
	done

ShamoutiIslandPikabluScript:
	opentext
	writetext .PikabluText
	cry MARILL
	waitbutton
	closetext
	end

.PikabluText:
	text "Pikablu: Rill!"
	done

ShamoutiIslandFisherScript:
	jumptextfaceplayer .Text

.Text:
	text "Today we're dancing"
	line "for no reason. ♪"

	para "Someday we'll"
	line "disappear for no"
	cont "reason."

	para "…You thought we'd"
	line "block the road?"

	para "That would be"
	line "rude!"
	done

ShamoutiIsland_MapEventHeader:
.Warps:
	db 6
	warp_def $d, $15, 1, SHAMOUTI_POKECENTER_1F
	warp_def $5, $21, 1, SHAMOUTI_HOTEL_1F
	warp_def $7, $10, 1, SHAMOUTI_TUNNEL
	warp_def $5, $1b, 1, SHAMOUTI_TOURIST_CENTER
	warp_def $c, $1f, 1, SHAMOUTI_HOUSE
	warp_def $d, $9, 1, SHAMOUTI_MERCHANT

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 6
	person_event SPRITE_BALL_CUT_FRUIT, 13, 34, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ShamoutiIslandFruitTree, -1
	person_event SPRITE_VILEPLUME, 8, 16, SPRITEMOVEDATA_DOLL, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ShamoutiIslandVileplumeScript, EVENT_SHAMOUTI_ISLAND_VILEPLUME
	person_event SPRITE_YOUNGSTER, 14, 24, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ShamoutiIslandYoungsterScript, EVENT_SHAMOUTI_ISLAND_PIKABLU_GUY
	person_event SPRITE_MARILL, 14, 25, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ShamoutiIslandPikabluScript, EVENT_SHAMOUTI_ISLAND_PIKABLU_GUY
	person_event SPRITE_FISHER, 2, 20, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, (1 << DAY), (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ShamoutiIslandFisherScript, -1
	person_event SPRITE_FISHER, 2, 23, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, (1 << DAY), (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ShamoutiIslandFisherScript, -1
