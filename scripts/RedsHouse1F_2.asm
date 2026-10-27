RedsHouse1FPrintMomText::
	ld a, [wStatusFlags4]
	bit BIT_GOT_STARTER, a
	jp nz, RedsHouse1FMomHealScript
	ld a, [wPlayerGender]
	and a
	jr nz, .girl1
	ld hl, .WakeUpText
	jr .next
.girl1
	ld hl, .WakeUpTextB
.next
	call PrintText
	ret

.WakeUpText:
	text_far _RedsHouse1FMomWakeUpText
	text_end

.WakeUpTextB:
	text_far _RedsHouse1FMomWakeUpTextB
	text_end

RedsHouse1FMomHealScript:
	ld hl, RedsHouse1FMomYouShouldRestText
	call PrintText
	call GBFadeOutToWhite
	call ReloadMapData
	predef HealParty
	ld a, MUSIC_PKMN_HEALED
	ld [wNewSoundID], a
	call PlaySound
.next
	ld a, [wChannelSoundIDs]
	cp MUSIC_PKMN_HEALED
	jr z, .next
	ld a, [wMapMusicSoundID]
	ld [wNewSoundID], a
	call PlaySound
	call GBFadeInFromWhite
	ld hl, RedsHouse1FMomLookingGreatText
	call PrintText
	ret

RedsHouse1FMomYouShouldRestText:
	text_far _RedsHouse1FMomYouShouldRestText
	text_end
RedsHouse1FMomLookingGreatText:
	text_far _RedsHouse1FMomLookingGreatText
	text_end

RedsHouse1FPrintTVText::
	ld hl, .WrongSideText
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	jp nz, .got_text
	ld a, [wPlayerGender]
	and a
	jr nz, .girl2
	ld hl, .StandByMeMovieText
	jr .got_text
.girl2
	ld hl, .WizardOfOzMovieText
.got_text
	call PrintText
	ret

.StandByMeMovieText:
	text_far _RedsHouse1FTVStandByMeMovieText
	text_end

.WizardOfOzMovieText:
	text_far _RedsHouse1FTVWizardOfOzMovieText
	text_end

.WrongSideText:
	text_far _RedsHouse1FTVWrongSideText
	text_end
