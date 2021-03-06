const_value set 2

Route16West_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TrainerLassGina:
	trainer EVENT_BEAT_LASS_GINA, LASS, GINA, .SeenText, .BeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext .AfterText
	waitbutton
	closetext
	end

.SeenText:
	text "Check out my new"
	line "outfit!"
	done

.BeatenText:
	text "If I'd spent money"
	line "on Potions instead"
	cont "of clothes…"
	done

.AfterText:
	text "My strappy sandals"
	line "look sooo cute,"
	cont "though! ♥"
	done

TrainerLassAlice:
	trainer EVENT_BEAT_LASS_ALICE, LASS, ALICE, .SeenText, .BeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext .AfterText
	waitbutton
	closetext
	end

.SeenText:
	text "Our eyes met!"

	para "Now you must date"
	line "me! ♥"

	para "No wait, I mean,"
	line "we must battle!"
	done

.BeatenText:
	text "How could you be"
	line "so cruel?"
	done

.AfterText:
	text "I'm really a guy…"
	line "Don't tell anyone!"
	done

TrainerCosplayerKuroko:
	trainer EVENT_BEAT_COSPLAYER_KUROKO, COSPLAYER, KUROKO, .SeenText, .BeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext .AfterText
	waitbutton
	closetext
	end

.SeenText:
	text "See how lifelike"
	line "my cosplay is?"
	done

.BeatenText:
	text "You just don't"
	line "appreciate art!"
	done

.AfterText:
	text "One time a trainer"
	line "threw a # Ball"
	cont "at me!"
	done

TrainerCooltrainerfSera:
	trainer EVENT_BEAT_COOLTRAINERF_SERA, COOLTRAINERF, SERA, .SeenText, .BeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext .AfterText
	waitbutton
	closetext
	end

.SeenText:
	text "Do you think you"
	line "can handle me?"
	done

.BeatenText:
	text "Congrats! ♥"
	done

.AfterText:
	text "I've gone out as a"
	line "a Cosplayer, but"

	para "an Ace Trainer's"
	line "outfit is more"
	cont "intimidating."
	done

TrainerBeautyNicole:
	trainer EVENT_BEAT_BEAUTY_NICOLE, BEAUTY, BEAUTY_NICOLE, .SeenText, .BeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext .AfterText
	waitbutton
	closetext
	end

.SeenText:
	text "Aren't my #mon"
	line "the cutest?"
	done

.BeatenText:
	text "They're even cute"
	line "while fainted…"
	done

.AfterText:
	text "Cute #mon can"
	line "be strong too,"
	cont "you know!"
	done

Route16WestMetronome:
	itemball METRONOME_I

Route16WestPPUp:
	itemball PP_UP

Route16WestMaxRevive:
	itemball MAX_REVIVE

Route16WestCutTree:
	jumpstd cuttree

Route16WestSignpost:
	jumptext .Text

.Text:
	text "Route 16"
	done

Route16WestHiddenRareCandy:
	dwb EVENT_ROUTE_16_WEST_HIDDEN_RARE_CANDY, RARE_CANDY

Route16West_MapEventHeader:
.Warps:
	db 1
	warp_def $1, $23, 1, PSYCHIC_INVERS_HOUSE

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 2, 59, SIGNPOST_READ, Route16WestSignpost
	signpost 5, 24, SIGNPOST_ITEM, Route16WestHiddenRareCandy

.PersonEvents:
	db 10
	person_event SPRITE_LASS, 7, 56, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 2, TrainerLassGina, -1
	person_event SPRITE_LASS, 7, 17, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 5, TrainerLassAlice, -1
	person_event SPRITE_COSPLAYER, 12, 9, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 2, TrainerCosplayerKuroko, -1
	person_event SPRITE_COOLTRAINER_F, 11, 40, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 1, TrainerCooltrainerfSera, -1
	person_event SPRITE_BEAUTY, 2, 6, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerBeautyNicole, -1
	person_event SPRITE_BALL_CUT_FRUIT, 14, 42, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_ITEMBALL, 0, Route16WestMetronome, EVENT_ROUTE_16_WEST_METRONOME
	person_event SPRITE_BALL_CUT_FRUIT, 2, 51, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_ITEMBALL, 0, Route16WestPPUp, EVENT_ROUTE_16_WEST_PP_UP
	person_event SPRITE_BALL_CUT_FRUIT, 2, 21, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_ITEMBALL, 0, Route16WestMaxRevive, EVENT_ROUTE_16_WEST_MAX_REVIVE
	person_event SPRITE_BALL_CUT_FRUIT, 7, 3, SPRITEMOVEDATA_CUTTABLE_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Route16WestCutTree, EVENT_ROUTE_16_WEST_CUT_TREE_1
	person_event SPRITE_BALL_CUT_FRUIT, 2, 57, SPRITEMOVEDATA_CUTTABLE_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Route16WestCutTree, EVENT_ROUTE_16_WEST_CUT_TREE_2
