; see constants/player_constants.asm

DefaultNamesBoy:
	db "New Name"
FOR n, 1, NUM_PLAYER_NAMES + 1
	next #BOYNAME{d:n}
ENDR
	db "@"

DefaultNamesGirl:
	db "New Name"
FOR n, 1, NUM_PLAYER_NAMES + 1
	next #GIRLNAME{d:n}
ENDR
	db "@"

DefaultNamesRival:
	db "New Name"
FOR n, 1, NUM_PLAYER_NAMES + 1
	next #RIVALNAME{d:n}
ENDR
	db "@"
