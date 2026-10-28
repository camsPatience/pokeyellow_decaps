TextScriptEndingText::
	text_end

TextScriptEnd::
	ld hl, TextScriptEndingText
	ret

ExclamationText::
	text_far _ExclamationText
	text_end

GroundRoseText::
	text_far _GroundRoseText
	text_end

BoulderText::
	text_asm
	ld a, [wStatusFlags1]
	bit BIT_STRENGTH_ACTIVE, a
	jr nz, .BouldersCanBeMovedText
	ld hl, RequiresStrengthText
	call PrintText
	ld a, [wObtainedBadges]
	bit BIT_RAINBOWBADGE, a		; check for rainbowbadge
	jr z, .done					; if no badge, stop
	ld a, STRENGTH
	ld [wSearchedMove], a
	farcall CheckPartyForMove
	jr c, .done
.useStrengthYesNo
	call WaitForTextScrollButtonPress
	ld hl, LikeToUseStrengthText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .closeTextBox
	farcall PrintStrengthText
.closeTextBox
	ld a, 1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a		; Jesus christ some of these are long
	jr .done
.BouldersCanBeMovedText
	ld hl, BouldersCanBeMovedText
	call PrintText
.done
	jr TextScriptEnd

RequiresStrengthText:
	text_far _RequiresStrengthText
	text_end

LikeToUseStrengthText:
	text_far _LikeToUseStrengthText
	text_end

BouldersCanBeMovedText:
	text_far _BouldersCanBeMovedText
	text_end

CalmWaterText::				; The comments get a lot more verbose here because I got tired of manually copying text and realized I had Ctrl+C on my side
	text_asm
	farcall IsSurfingAllowed ; checks for Cycling Road and Seafoam Islands B4F
	ld hl, wStatusFlags1
	bit BIT_SURF_ALLOWED, [hl]
	res BIT_SURF_ALLOWED, [hl]
	jp z, .closeTextBox		 ; exit routine if surfing is disallowed
	ld hl, WaterIsCalmText
	call PrintText
	ld a, [wObtainedBadges]
	bit BIT_SOULBADGE, a	; check for Koga's badge
	jr z, .done				; if no SoulBadge, text ends here
	ld a, SURF
	ld [wSearchedMove], a	; store MoveID here, else it won't persist through the farcall
	farcall CheckPartyForMove
	jr c, .done
.useSurfYesNo
	call WaitForTextScrollButtonPress
	ld hl, LikeToUseSurfText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .closeTextBox
.MonUsingSurf
	ld a, SURFBOARD ; using SURF from the Party Menu works the exact same way
	ld [wCurItem], a
	ld [wPseudoItemID], a
	call UseItem
.closeTextBox
	ld a, 1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
.done
	jp TextScriptEnd

WaterIsCalmText:
	text_far _WaterIsCalmText
	text_end

LikeToUseSurfText:
	text_far _LikeToUseSurfText
	text_end

CutTreeText::
	text_asm
	ld hl, TreeCanBeCutText
	call PrintText
	ld a, [wObtainedBadges]
	bit BIT_CASCADEBADGE, a			; check for Misty's badge
	jr z, .done						; if no CascadeBadge, text ends here
	ld a, CUT
	ld [wSearchedMove], a			; store MoveID here, else it won't persist through the farcall
	farcall CheckPartyForMove
	jr c, .done
.useCutYesNo
	call WaitForTextScrollButtonPress
	ld hl, LikeToUseCutText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .closeTextBox
.MonUsingCut
	ld hl, UsedCutAltText
	call PrintText
	predef UsedCut
.closeTextBox ; see commented note below
	xor a
	ld [wSearchedMove], a ; make sure wSearchedMove != CUT before exiting the routine
	ld a, 1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
.done
	jp TextScriptEnd

; Note: The above instance of .closeTextBox is different because we've inserted a conditional jump in 'predef UsedCut'. This jump determines
; whether to execute the routine as normal, when the player uses Cut from the Party Menu. If using Cut from the overworld, the routine skips
; the screen white-out back to the overworld. It also skips loading the Cut user's name, since we already got it from CheckPartyForMove. The
; short version of the routine gets executed ONLY when wSearchedMove = CUT. We MUST therefore ensure that we change that value just in case
; we need the full routine should Cut ever get used from the menu. Trying to execute Cut from the menu while using the abridged routine has
; some fairly disastrous graphical consequences... and for what it's worth, the text will be wrong, too.

TreeCanBeCutText:
	text_far _TreeCanBeCutText
	text_end

LikeToUseCutText:
	text_far _LikeToUseCutText
	text_end

UsedCutAltText:
	text_far _UsedCutText
	text_end

MartSignText::
	text_far _MartSignText
	text_end

PokeCenterSignText::
	text_far _PokeCenterSignText
	text_end

PickUpItemText::
	text_asm
	predef PickUpItem
	jp TextScriptEnd
