SaffronPokecenter_Script:
	call Serial_TryEstablishingExternallyClockedConnection
	jp EnableAutoTextBoxDrawing

SaffronPokecenter_TextPointers:
	def_text_pointers
	dw_const SaffronPokecenterNurseText,            TEXT_SAFFRONPOKECENTER_NURSE
	dw_const SaffronPokecenterBeautyText,           TEXT_SAFFRONPOKECENTER_BEAUTY
	dw_const SaffronPokecenterGentlemanText,        TEXT_SAFFRONPOKECENTER_GENTLEMAN
	dw_const SaffronPokecenterLinkReceptionistText, TEXT_SAFFRONPOKECENTER_LINK_RECEPTIONIST
	dw_const SaffronPokecenterChanseyText,          TEXT_SAFFRONPOKECENTER_CHANSEY
	dw_const SaffronPokeCenterHRTText,              TEXT_SAFFRONPOKECENTER_HRT

SaffronPokeCenterHRTText:
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

SaffronPokecenterNurseText:
	script_pokecenter_nurse

SaffronPokecenterBeautyText:
	text_far _SaffronPokecenterBeautyText
	text_end

SaffronPokecenterGentlemanText:
	text_far _SaffronPokecenterGentlemanText
	text_end

SaffronPokecenterLinkReceptionistText:
	script_cable_club_receptionist

SaffronPokecenterChanseyText:
	text_asm
	callfar PokecenterChanseyText
	jp TextScriptEnd
