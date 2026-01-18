_Route1Youngster1MartSampleText::
	text "Hi! I work at a"
	line "#mon Mart."

	para "It's a convenient"
	line "shop, so please"
	cont "visit us in"
	cont "Viridian City."

	para "I know, I'll give"
	line "you a sample!"
	cont "Here you go!"
	prompt

_Route1Youngster1GotPotionText::
	text "<PLAYER> got"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

_Route1Youngster1AlsoGotPokeballsText::
	text "We also carry"
	line "# Balls for"
	cont "catching #mon!"
	done

_Route1Youngster1NoRoomText::
	text "You have too much"
	line "stuff with you!"
	done

_Route1Youngster2Text::
	text "See those ledges"
	line "along the road?"

	para "It's a bit scary,"
	line "but you can jump"
	cont "from them."

	para "You can get back"
	line "to Pallet Town"
	cont "quicker that way."
	done

_Route1SignText::
	text "Route 1"
	line "Pallet Town -"
	cont "Viridian City"
	done
