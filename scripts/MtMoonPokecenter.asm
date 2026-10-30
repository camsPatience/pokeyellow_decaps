MtMoonPokecenter_Script:
	call Serial_TryEstablishingExternallyClockedConnection
	jp EnableAutoTextBoxDrawing

MtMoonPokecenter_TextPointers:
	def_text_pointers
	dw_const MtMoonPokecenterNurseText,            TEXT_MTMOONPOKECENTER_NURSE
	dw_const MtMoonPokecenterYoungsterText,        TEXT_MTMOONPOKECENTER_YOUNGSTER
	dw_const MtMoonPokecenterGentlemanText,        TEXT_MTMOONPOKECENTER_GENTLEMAN
	dw_const MtMoonPokecenterMagikarpSalesmanText, TEXT_MTMOONPOKECENTER_MAGIKARP_SALESMAN
	dw_const MtMoonPokecenterClipboardText,        TEXT_MTMOONPOKECENTER_CLIPBOARD
	dw_const MtMoonPokecenterLinkReceptionistText, TEXT_MTMOONPOKECENTER_LINK_RECEPTIONIST
	dw_const MtMoonPokecenterChanseyText,          TEXT_MTMOONPOKECENTER_CHANSEY
	dw_const MtMoonPokeCenterHRTText,              TEXT_MTMOONPOKECENTER_HRT

MtMoonPokeCenterHRTText:
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

MtMoonPokecenterNurseText:
	script_pokecenter_nurse

MtMoonPokecenterYoungsterText:
	text_far _MtMoonPokecenterYoungsterText
	text_end

MtMoonPokecenterGentlemanText:
	text_far _MtMoonPokecenterGentlemanText
	text_end

MtMoonPokecenterMagikarpSalesmanText:
	text_asm
	callfar MagikarpSalesman
	jp TextScriptEnd

MtMoonPokecenterClipboardText:
	text_far _MtMoonPokecenterClipboardText
	text_end

MtMoonPokecenterLinkReceptionistText:
	script_cable_club_receptionist

MtMoonPokecenterChanseyText:
	text_asm
	callfar PokecenterChanseyText
	jp TextScriptEnd
