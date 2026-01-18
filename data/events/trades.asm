MACRO npctrade
; give mon, get mon, dialog id, nickname
	db \1, \2, \3
	dname \4, NAME_LENGTH
ENDM

TradeMons:
; entries correspond to TRADE_FOR_* constants
	table_width 3 + NAME_LENGTH
	; The two instances of TRADE_DIALOGSET_EVOLUTION are a leftover
	; from the Japanese Blue trades, which used species that evolve.
	; TRADE_DIALOGSET_EVOLUTION did not refer to evolution in Japanese
	; Red/Green. Japanese Blue changed _AfterTrade2Text to say your Pokémon
	; "went and evolved" and also changed the trades to match. English
	; Red/Blue uses the original JP Red/Green trades but with the JP Blue
	; post-trade text. English Yellow changed _AfterTrade2Text to
	; not mention evolution.
	npctrade LICKITUNG,  DUGTRIO,  TRADE_DIALOGSET_CASUAL,    "Gurio"
	npctrade CLEFAIRY,   MR_MIME,  TRADE_DIALOGSET_CASUAL,    "Miles"
	npctrade BUTTERFREE, BEEDRILL, TRADE_DIALOGSET_HAPPY,     "Stinger" ; unused
	npctrade KANGASKHAN, MUK,      TRADE_DIALOGSET_CASUAL,    "Sticky"
	npctrade MEW,        MEW,      TRADE_DIALOGSET_HAPPY,     "Bart"    ; unused
	npctrade TANGELA,    PARASECT, TRADE_DIALOGSET_CASUAL,    "Spike"
	npctrade PIDGEOT,    PIDGEOT,  TRADE_DIALOGSET_EVOLUTION, "Marty"   ; unused
	npctrade GOLDUCK,    RHYDON,   TRADE_DIALOGSET_EVOLUTION, "Buffy"
	npctrade GROWLITHE,  DEWGONG,  TRADE_DIALOGSET_HAPPY,     "Cezanne"
	npctrade CUBONE,     MACHOKE,  TRADE_DIALOGSET_HAPPY,     "Ricky"
	assert_table_length NUM_NPC_TRADES
