PewterPokecenter_Script:
	ld hl, wPikachuMapScriptFlags
	set BIT_PIKACHU_MAP_SCRIPT_ACTIVE, [hl]
	call Serial_TryEstablishingExternallyClockedConnection
	call EnableAutoTextBoxDrawing
	ret

PewterPokecenter_TextPointers:
	def_text_pointers
	dw_const PewterPokecenterNurseText,            TEXT_PEWTERPOKECENTER_NURSE
	dw_const PewterPokecenterGentlemanText,        TEXT_PEWTERPOKECENTER_GENTLEMAN
	dw_const PewterPokecenterJigglypuffText,       TEXT_PEWTERPOKECENTER_JIGGLYPUFF
	dw_const PewterPokecenterLinkReceptionistText, TEXT_PEWTERPOKECENTER_LINK_RECEPTIONIST
	dw_const PewterPokecenterCooltrainerFText,     TEXT_PEWTERPOKECENTER_COOLTRAINER_F
	dw_const PewterPokecenterChanseyText,          TEXT_PEWTERPOKECENTER_CHANSEY
	dw_const PewterPokeCenterHRTText,              TEXT_PEWTERPOKECENTER_HRT

PewterPokeCenterHRTText:
	text_asm
	ld hl, .PokeCenterHRTText1
	call PrintText ; show it
	call BoyGirlChoice2 ; added routine at the end of this file
		ld a, [wCurrentMenuItem]
		and a
		ld [wPlayerGender], a ; store gender. 00 for boy, 01 for girl, 02 for enby
		jr nz, .next
.next
	ld hl, .PokeCenterHRTText2
	call PrintText ; show it
	jp TextScriptEnd

.PokeCenterHRTText1: ; Make the compiler shut up
	text_far _PokeCenterHRTText1
	text_end

.PokeCenterHRTText2: ; Make the compiler shut up
	text_far _PokeCenterHRTText2
	text_end

PewterPokecenterNurseText:
	script_pokecenter_nurse

PewterPokecenterGentlemanText:
	text_far _PewterPokecenterGentlemanText
	text_end

PewterPokecenterJigglypuffText:
	text_asm
	farcall PewterJigglypuff
	jp TextScriptEnd

PewterPokecenterLinkReceptionistText:
	script_cable_club_receptionist

PewterPokecenterCooltrainerFText:
	text_asm
	farcall PewterPokecenterPrintCooltrainerFText
	jp TextScriptEnd

PewterPokecenterChanseyText:
	text_asm
	callfar PokecenterChanseyText
	jp TextScriptEnd
