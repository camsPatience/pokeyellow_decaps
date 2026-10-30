CinnabarPokecenter_Script:
	call Serial_TryEstablishingExternallyClockedConnection
	jp EnableAutoTextBoxDrawing

CinnabarPokecenter_TextPointers:
	def_text_pointers
	dw_const CinnabarPokecenterNurseText,            TEXT_CINNABARPOKECENTER_NURSE
	dw_const CinnabarPokecenterCooltrainerFText,     TEXT_CINNABARPOKECENTER_COOLTRAINER_F
	dw_const CinnabarPokecenterGentlemanText,        TEXT_CINNABARPOKECENTER_GENTLEMAN
	dw_const CinnabarPokecenterLinkReceptionistText, TEXT_CINNABARPOKECENTER_LINK_RECEPTIONIST
	dw_const CinnabarPokecenterChanseyText,          TEXT_CINNABARPOKECENTER_CHANSEY
	dw_const CinnabarPokeCenterHRTText,              TEXT_CINNABARPOKECENTER_HRT

CinnabarPokeCenterHRTText:
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

CinnabarPokecenterNurseText:
	script_pokecenter_nurse

CinnabarPokecenterCooltrainerFText:
	text_far _CinnabarPokecenterCooltrainerFText
	text_end

CinnabarPokecenterGentlemanText:
	text_far _CinnabarPokecenterGentlemanText
	text_end

CinnabarPokecenterLinkReceptionistText:
	script_cable_club_receptionist

CinnabarPokecenterChanseyText:
	text_asm
	callfar PokecenterChanseyText
	jp TextScriptEnd
