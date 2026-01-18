_CopycatsHouse2FCopycatDoYouLikePokemonText::
	text "<PLAYER>: Hi! Do"
	line "you like #mon?"

	para "<PLAYER>: Uh no, I"
	line "just asked you."

	para "<PLAYER>: Huh?"
	line "You're strange!"

	para "Copycat: Hmm?"
	line "Quit mimicking?"

	para "But, that's my"
	line "favorite hobby!"
	prompt

_CopycatsHouse2FCopycatTM31PreReceiveText::
	text "Oh wow!"
	line "A # Doll!"

	para "For me?"
	line "Thank you!"

	para "You can have"
	line "this, then!"
	prompt

_CopycatsHouse2FCopycatReceivedTM31Text::
	text "<PLAYER> received"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

_CopycatsHouse2FCopycatTM31Explanation1Text::
	text_start

	para "TM31 contains my"
	line "favorite, Mimic!"

	para "Use it on a good"
	line "#mon!@"
	text_end

_CopycatsHouse2FCopycatTM31Explanation2Text::
	text "<PLAYER>: Hi!"
	line "Thanks for TM31!"

	para "<PLAYER>: Pardon?"

	para "<PLAYER>: Is it"
	line "that fun to mimic"
	cont "my every move?"

	para "Copycat: You bet!"
	line "It's a scream!"
	done

_CopycatsHouse2FCopycatTM31NoRoomText::
	text "Don't you want"
	line "this?@"
	text_end

_CopycatsHouse2FDoduoText::
	text "Doduo: Giiih!"

	para "MIRROR MIRROR ON"
	line "THE WALL, WHO IS"
	cont "THE FAIREST ONE"
	cont "OF ALL?"
	done

_CopycatsHouse2FRareDollText::
	text "This is a rare"
	line "#mon! Huh?"
	cont "It's only a doll!"
	done

_CopycatsHouse2FSNESText::
	text "A game with Mario"
	line "wearing a bucket"
	cont "on his head!"
	done

_CopycatsHouse2FPCMySecretsText::
	text "..."

	para "My Secrets!"

	para "Skill: Mimicry!"
	line "Hobby: Collecting"
	cont "dolls!"
	cont "Favorite #mon:"
	cont "Clefairy!"
	done

_CopycatsHouse2FPCCantSeeText::
	text "Huh? Can't see!"
	done
