VermilionPokecenter_Script:
	call Serial_TryEstablishingExternallyClockedConnection
	jp EnableAutoTextBoxDrawing

VermilionPokecenter_TextPointers:
	def_text_pointers
	dw_const VermilionPokecenterNurseText,            TEXT_VERMILIONPOKECENTER_NURSE
	dw_const VermilionPokecenterFishingGuruText,      TEXT_VERMILIONPOKECENTER_FISHING_GURU
	dw_const VermilionPokecenterSailorText,           TEXT_VERMILIONPOKECENTER_SAILOR
	dw_const VermilionPokecenterLinkReceptionistText, TEXT_VERMILIONPOKECENTER_LINK_RECEPTIONIST
	dw_const VermilionPokecenterChanseyText,          TEXT_VERMILIONPOKECENTER_CHANSEY
	dw_const VermilionPokeCenterHRTText,              TEXT_VERMILIONPOKECENTER_HRT

VermilionPokeCenterHRTText:
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

VermilionPokecenterNurseText:
	script_pokecenter_nurse

VermilionPokecenterFishingGuruText:
	text_far _VermilionPokecenterFishingGuruText
	text_end

VermilionPokecenterSailorText:
	text_far _VermilionPokecenterSailorText
	text_end

VermilionPokecenterLinkReceptionistText:
	script_cable_club_receptionist

VermilionPokecenterChanseyText:
	text_asm
	callfar PokecenterChanseyText
	jp TextScriptEnd
