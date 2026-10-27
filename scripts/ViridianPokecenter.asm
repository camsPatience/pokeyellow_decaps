ViridianPokecenter_Script:
	call Serial_TryEstablishingExternallyClockedConnection
	jp EnableAutoTextBoxDrawing

ViridianPokecenter_TextPointers:
	def_text_pointers
	dw_const ViridianPokecenterNurseText,            TEXT_VIRIDIANPOKECENTER_NURSE
	dw_const ViridianPokecenterGentlemanText,        TEXT_VIRIDIANPOKECENTER_GENTLEMAN
	dw_const ViridianPokecenterCooltrainerMText,     TEXT_VIRIDIANPOKECENTER_COOLTRAINER_M
	dw_const ViridianPokecenterLinkReceptionistText, TEXT_VIRIDIANPOKECENTER_LINK_RECEPTIONIST
	dw_const ViridianPokeCenterChanseyText,          TEXT_VIRIDIANPOKECENTER_CHANSEY
	dw_const ViridianPokeCenterHRTText,              TEXT_VIRIDIANPOKECENTER_HRT

ViridianPokecenterNurseText:
	script_pokecenter_nurse

ViridianPokecenterGentlemanText:
	text_far _ViridianPokecenterGentlemanText
	text_end

ViridianPokecenterCooltrainerMText:
	text_far _ViridianPokecenterCooltrainerMText
	text_end

ViridianPokecenterLinkReceptionistText:
	script_cable_club_receptionist

ViridianPokeCenterChanseyText:
	text_asm
	callfar PokecenterChanseyText
	jp TextScriptEnd

ViridianPokeCenterHRTText:
	text_asm
	ld hl, .ViridianPokeCenterHRTText1
	call PrintText ; show it
	call BoyGirlChoice2 ; added routine at the end of this file
		ld a, [wCurrentMenuItem]
		and a
		ld [wPlayerGender], a ; store gender. 00 for boy, 01 for girl, 02 for enby
		jr nz, .next
.next
	ld hl, .ViridianPokeCenterHRTText2
	call PrintText ; show it
	jp TextScriptEnd

.ViridianPokeCenterHRTText1: ; Make the compiler shut up
	text_far _ViridianPokeCenterHRTText1
	text_end

.ViridianPokeCenterHRTText2: ; Make the compiler shut up
	text_far _ViridianPokeCenterHRTText2
	text_end

; displays boy/girl choice
BoyGirlChoice2::
	call SaveScreenTilesToBuffer1
	call InitBoyGirlTextBoxParameters2
	jr DisplayBoyGirlChoice2

InitBoyGirlTextBoxParameters2::
   ld a, $1 ; loads the value for the unused North/West choice, that was changed to say Boy/Girl
   ld [wTwoOptionMenuID], a
   coord hl, 13, 7
   ld bc, $80e
   ret

DisplayBoyGirlChoice2::
   ld a, $14
   ld [wTextBoxID], a
   call DisplayTextBoxID
   jp LoadScreenTilesFromBuffer1
