RockTunnelPokecenter_Script:
	call Serial_TryEstablishingExternallyClockedConnection
	jp EnableAutoTextBoxDrawing

RockTunnelPokecenter_TextPointers:
	def_text_pointers
	dw_const RockTunnelPokecenterNurseText,            TEXT_ROCKTUNNELPOKECENTER_NURSE
	dw_const RockTunnelPokecenterGentlemanText,        TEXT_ROCKTUNNELPOKECENTER_GENTLEMAN
	dw_const RockTunnelPokecenterFisherText,           TEXT_ROCKTUNNELPOKECENTER_FISHER
	dw_const RockTunnelPokecenterLinkReceptionistText, TEXT_ROCKTUNNELPOKECENTER_LINK_RECEPTIONIST
	dw_const RockTunnelPokecenterChanseyText,          TEXT_ROCKTUNNELPOKECENTER_CHANSEY
	dw_const RockTunnelPokeCenterHRTText,              TEXT_ROCKTUNNELPOKECENTER_HRT

RockTunnelPokeCenterHRTText:
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

RockTunnelPokecenterNurseText:
	script_pokecenter_nurse

RockTunnelPokecenterGentlemanText:
	text_far _RockTunnelPokecenterGentlemanText
	text_end

RockTunnelPokecenterFisherText:
	text_far _RockTunnelPokecenterFisherText
	text_end

RockTunnelPokecenterLinkReceptionistText:
	script_cable_club_receptionist

RockTunnelPokecenterChanseyText:
	text_asm
	callfar PokecenterChanseyText
	jp TextScriptEnd
