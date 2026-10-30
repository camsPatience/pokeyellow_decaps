LavenderPokecenter_Script:
	call Serial_TryEstablishingExternallyClockedConnection
	jp EnableAutoTextBoxDrawing

LavenderPokecenter_TextPointers:
	def_text_pointers
	dw_const LavenderPokecenterNurseText,            TEXT_LAVENDERPOKECENTER_NURSE
	dw_const LavenderPokecenterGentlemanText,        TEXT_LAVENDERPOKECENTER_GENTLEMAN
	dw_const LavenderPokecenterLittleGirlText,       TEXT_LAVENDERPOKECENTER_LITTLE_GIRL
	dw_const LavenderPokecenterLinkReceptionistText, TEXT_LAVENDERPOKECENTER_LINK_RECEPTIONIST
	dw_const LavenderPokecenterChanseyText,          TEXT_LAVENDERPOKECENTER_CHANSEY
	dw_const LavenderPokeCenterHRTText,              TEXT_LAVENDERPOKECENTER_HRT

LavenderPokeCenterHRTText:
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

LavenderPokecenterLinkReceptionistText:
	script_cable_club_receptionist

LavenderPokecenterNurseText:
	script_pokecenter_nurse

LavenderPokecenterGentlemanText:
	text_far _LavenderPokecenterGentlemanText
	text_end

LavenderPokecenterLittleGirlText:
	text_far _LavenderPokecenterLittleGirlText
	text_end

LavenderPokecenterChanseyText:
	text_asm
	callfar PokecenterChanseyText
	jp TextScriptEnd
