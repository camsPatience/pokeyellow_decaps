; displays yes/no choice
; yes -> set carry
YesNoChoice::
	call SaveScreenTilesToBuffer1
	call InitYesNoTextBoxParameters
	jr DisplayYesNoChoice

TwoOptionMenu:: ; unreferenced
	ld a, TWO_OPTION_MENU
	ld [wTextBoxID], a
	call InitYesNoTextBoxParameters
	jp DisplayTextBoxID

InitYesNoTextBoxParameters::
	xor a ; YES_NO_MENU
	ld [wTwoOptionMenuID], a
	hlcoord 14, 7
	lb bc, 8, 15
	ret

YesNoChoicePokeCenter::
	call SaveScreenTilesToBuffer1
	ld a, HEAL_CANCEL_MENU
	ld [wTwoOptionMenuID], a
	hlcoord 11, 6
	lb bc, 8, 12
	jr DisplayYesNoChoice

WideYesNoChoice:: ; unreferenced
	call SaveScreenTilesToBuffer1
	ld a, WIDE_YES_NO_MENU
	ld [wTwoOptionMenuID], a
	hlcoord 12, 7
	lb bc, 8, 13

DisplayYesNoChoice::
	ld a, TWO_OPTION_MENU
	ld [wTextBoxID], a
	call DisplayTextBoxID
	jp LoadScreenTilesFromBuffer1

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
