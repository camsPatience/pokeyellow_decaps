; see constants/player_constants.asm

DefaultNamesBoyList:
	db "New Name@"
	list_start PLAYER_NAME_LENGTH - 1
FOR n, 1, NUM_PLAYER_NAMES + 1
	li #BOYNAME{d:n}
ENDR
	assert_list_length NUM_PLAYER_NAMES

DefaultNamesGirlList:
	db "New Name@"
	list_start PLAYER_NAME_LENGTH - 1
FOR n, 1, NUM_PLAYER_NAMES + 1
	li #GIRLNAME{d:n}
ENDR
	assert_list_length NUM_PLAYER_NAMES

DefaultNamesRivalList:
	db "New Name@"
	list_start PLAYER_NAME_LENGTH - 1
FOR n, 1, NUM_PLAYER_NAMES + 1
	li #RIVALNAME{d:n}
ENDR
	assert_list_length NUM_PLAYER_NAMES
