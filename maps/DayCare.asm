const_value set 2
	const DAYCARE_GRAMPS
	const DAYCARE_GRANNY
	const DAYCARE_LYRA

DayCare_MapScriptHeader:
.MapTriggers:
	db 1
	dw .Trigger0

.MapCallbacks:
	db 1
	dbw MAPCALLBACK_OBJECTS, .EggCheckCallback

.Trigger0:
	priorityjump DayCare_MeetGrandma
	end

.EggCheckCallback:
	checkflag ENGINE_DAYCARE_MAN_HAS_EGG
	iftrue .PutDaycareManOutside
	clearevent EVENT_DAYCARE_MAN_IN_DAYCARE
	setevent EVENT_DAYCARE_MAN_ON_ROUTE_34
	return

.PutDaycareManOutside:
	setevent EVENT_DAYCARE_MAN_IN_DAYCARE
	clearevent EVENT_DAYCARE_MAN_ON_ROUTE_34
	return

DayCare_MeetGrandma:
	follow DAYCARE_LYRA, PLAYER
	applymovement DAYCARE_LYRA, DayCareMovementData_LyraApproachesGrandma
	stopfollow
	spriteface PLAYER, UP
	spriteface DAYCARE_GRANNY, DOWN
	opentext
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .IntroduceFemale
	writetext DayCareLyraHelloText1
	jump .Continue1
.IntroduceFemale:
	writetext DayCareLyraHelloText2
.Continue1:
	waitbutton
	closetext
	showemote EMOTE_SHOCK, DAYCARE_LYRA, 15
	opentext
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .ProtestFemale
	writetext DayCareLyraProtestText1
	jump .Continue2
.ProtestFemale:
	writetext DayCareLyraProtestText2
.Continue2:
	waitbutton
	closetext
	spriteface DAYCARE_LYRA, DOWN
	opentext
	writetext DayCareLyraGoodbyeText
	waitbutton
	closetext
	applymovement DAYCARE_LYRA, DayCareMovementData_LyraStartsToLeave
	showemote EMOTE_SHOCK, DAYCARE_LYRA, 15
	spriteface DAYCARE_LYRA, LEFT
	spriteface PLAYER, RIGHT
	opentext
	writetext DayCareLyraForgotText
	waitbutton
	closetext
	addcellnum PHONE_LYRA
	opentext
	writetext GotLyrasNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	waitbutton
	closetext
	spriteface DAYCARE_LYRA, UP
	opentext
	writetext DayCareLyraEmbarassedText
	waitbutton
	closetext
	applymovement DAYCARE_LYRA, DayCareMovementData_LyraLeaves
	disappear DAYCARE_LYRA
	dotrigger $1
	end

DayCareManScript_Inside:
	faceplayer
	opentext
	checkevent EVENT_GOT_ODD_EGG
	iftrue .AlreadyHaveOddEgg
	writetext DayCareManText_GiveOddEgg
	buttonsound
	checkcode VAR_PARTYCOUNT
	if_equal PARTY_LENGTH, .PartyFull
	special GiveOddEgg
	writetext DayCareText_GotOddEgg
	playsound SFX_GET_EGG_FROM_DAYCARE_LADY
	waitsfx
	writetext DayCareText_DescribeOddEgg
	waitbutton
	closetext
	setevent EVENT_GOT_ODD_EGG
	end

.PartyFull:
	writetext DayCareText_PartyFull
	waitbutton
	closetext
	end

.AlreadyHaveOddEgg:
	special Special_DayCareMan
	waitbutton
	closetext
	end

DayCareLadyScript:
	faceplayer
	opentext
	checkflag ENGINE_DAYCARE_MAN_HAS_EGG
	iftrue .HusbandWasLookingForYou
	checkevent EVENT_LYRA_GAVE_AWAY_EGG
	iffalse .NoLyrasEgg
	checkevent EVENT_GOT_LYRAS_EGG
	iftrue .NoLyrasEgg
	writetext DayCareLadyText_GiveLyrasEgg
	buttonsound
	checkcode VAR_PARTYCOUNT
	if_equal PARTY_LENGTH, .PartyFull
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .GiveCyndaquilEgg
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .GiveTotodileEgg
	giveegg CHIKORITA, EGG_LEVEL
	jump .GotLyrasEgg

.GiveCyndaquilEgg:
	giveegg CYNDAQUIL, EGG_LEVEL
	jump .GotLyrasEgg

.GiveTotodileEgg:
	giveegg TOTODILE, EGG_LEVEL
.GotLyrasEgg
	farwritetext UnknownText_0x1bdfa5
	playsound SFX_GET_EGG_FROM_DAYCARE_LADY
	waitsfx
	writetext DayCareLadyText_DescribeLyrasEgg
	waitbutton
	closetext
	setevent EVENT_GOT_LYRAS_EGG
	end

.PartyFull:
	writetext DayCareText_PartyFull
	waitbutton
	closetext
	end

.NoLyrasEgg:
	special Special_DayCareLady
	waitbutton
	closetext
	end

.HusbandWasLookingForYou:
	writetext Text_GrampsLookingForYou
	waitbutton
	closetext
	end

DayCareBookshelf:
	jumpstd difficultbookshelf

DayCareMovementData_LyraApproachesGrandma:
	step_right
	step_right
	step_right
	step_right
	step_right
	step_up
	step_end

DayCareMovementData_LyraStartsToLeave:
	step_right
	step_down
	step_end

DayCareMovementData_LyraLeaves:
	step_down
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

DayCareLyraHelloText1:
	text "Lyra: Grandma!"

	para "Let me introduce"
	line "my friend."

	para "This is <PLAYER>!"

	para "Grandma: Ah ha."

	para "This is your"
	line "boy… friend."

	para "I see. Hmm."
	done

DayCareLyraHelloText2:
	text "Lyra: Grandma!"

	para "Let me introduce"
	line "my friend."

	para "This is <PLAYER>!"

	para "Grandma: Ah ha."

	para "This is your"
	line "girl… friend."

	para "I see. Hmm."
	done

DayCareLyraProtestText1:
	text "Lyra: What?"
	line "Grandma…!"

	para "What are you"
	line "talking about?"

	para "He just lives"
	line "nearby…"

	para "Grandma: Hahaha."
	line "I know, I know."

	para "You must be sure"
	line "he's talented."

	para "Right, <PLAYER>?"
	line "Come and see us"
	cont "anytime!"
	done

DayCareLyraProtestText2:
	text "Lyra: What?"
	line "Grandma…!"

	para "What are you"
	line "talking about?"

	para "She just lives"
	line "nearby…"

	para "Grandma: Hahaha."
	line "I know, I know."

	para "You must be sure"
	line "she's talented."

	para "Right, <PLAYER>?"
	line "Come and see us"
	cont "anytime!"
	done

DayCareLyraGoodbyeText:
	text "Lyra: Well, I'd"
	line "better go now…"
	cont "See ya!"
	done

DayCareLyraForgotText:
	text "Lyra: Oh!"
	line "I almost forgot!"

	para "Here! This is my"
	line "#gear number!"
	done

GotLyrasNumberText:
	text "<PLAYER> got Lyra's"
	line "phone number."
	done

DayCareLyraEmbarassedText:
	text "Lyra: Grandma!"

	para "Don't you say"
	line "anything."

	para "We're both train-"
	line "ers, and we're"

	para "supposed to ex-"
	line "change numbers."
	cont "That's all."
	done

Text_GrampsLookingForYou:
	text "Gramps was looking"
	line "for you."
	done

DayCareManText_GiveOddEgg:
	text "I'm the Day-Care"
	line "Man."

	para "Do you know about"
	line "Eggs?"

	para "I was raising"
	line "#mon with my"
	cont "wife, you see."

	para "We were shocked to"
	line "find an Egg!"

	para "How incredible is"
	line "that?"

	para "Well, wouldn't you"
	line "like this Egg?"

	para "Then fine, this is"
	line "yours to keep!"
	done

DayCareText_GotOddEgg:
	text "<PLAYER> received"
	line "the Odd Egg!"
	done

DayCareText_DescribeOddEgg:
	text "I found that when"
	line "I was caring for"

	para "someone's #mon"
	line "before."

	para "But the trainer"
	line "didn't want the"

	para "Egg, so I'd kept"
	line "it around."
	done

DayCareLadyText_GiveLyrasEgg:
	text "Hello, dear."

	para "Lyra told me this"
	line "Egg was a gift for"
	cont "you. Here you go!"
	done

DayCareLadyText_DescribeLyrasEgg:
	text "That Egg came from"
	line "her first #mon."

	para "She must really"
	line "trust you as a"
	cont "trainer."
	done

DayCareText_PartyFull:
	text "You've no room for"
	line "this."
	done

DayCare_MapEventHeader:
.Warps:
	db 4
	warp_def $4, $0, 3, ROUTE_34
	warp_def $5, $0, 4, ROUTE_34
	warp_def $7, $2, 5, ROUTE_34
	warp_def $7, $3, 5, ROUTE_34

.XYTriggers:
	db 0

.Signposts:
	db 1
	signpost 1, 5, SIGNPOST_READ, DayCareBookshelf

.PersonEvents:
	db 3
	person_event SPRITE_GRAMPS, 3, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, DayCareManScript_Inside, EVENT_DAYCARE_MAN_IN_DAYCARE
	person_event SPRITE_GRANNY, 3, 5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, DayCareLadyScript, -1
	person_event SPRITE_LYRA, 5, 0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_LYRA_DAYCARE
