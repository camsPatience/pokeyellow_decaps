; prints text for bookshelves in buildings without sign events
PrintBookshelfText::
	lda_coord 8, 9
	ld [wTilePlayerStandingOn], a			; so the game knows EXACTLY where we are and what we're standing on
	predef GetTileAndCoordsInFrontOfPlayer	; so the game knows EXACTLY what's in front of us
	call UpdateSprites
	farcall IsNextTileShoreOrWater			; are we looking at water?
	jr c, .checkIfCutTreeMap				; if not, check if we're on a map that has Cut trees
.shoreOrWater
	predef GetTileAndCoordsInFrontOfPlayer ; stores id of tile in front of player in c
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	jr nz, .foundPlayerSpriteFacing ; if we're NOT facing up, all is good
.checkCurrentMapTileset ; check to prevent unintended northward surfing from elevated areas in CAVERN and FOREST maps
	lda_coord 8, 9
	ld b, a
	ld a, [wCurMapTileset]
	cp CAVERN
	ld a, $05	; elevated cavern floor tile
	jr z, .checkIfTileIsPassable
	ld a, [wCurMapTileset]
	cp FOREST
	ld a, $2e	; elevated forest floor tile
	jr nz, .foundPlayerSpriteFacing ; move on if we're not in a CAVERN or FOREST map
.checkIfTileIsPassable
	cp b ; are we standing on elevated floor? If so, there's no way we should be able to Surf...
	jr z, .end
.foundPlayerSpriteFacing
	ld a, [wCurMapTileset]
	ld b, a 			; b = current tileset
	jr .loadBookshelfTileIDs
.checkIfCutTreeMap
	predef GetTileAndCoordsInFrontOfPlayer
	ld a, [wCurMapTileset]		; Cut trees can only be found in the OVERWORLD and GYM tilesets
	ld b, a
	cp OVERWORLD
	jr z, .loadBookshelfTileIDs
	cp GYM
	jr z, .loadBookshelfTileIDs
.checkIfBookshelf
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	jr nz, .noMatch
; facing up
	ld a, [wCurMapTileset]
	ld b, a
	lda_coord 8, 7
	ld c, a
.loadBookshelfTileIDs
	ld hl, BookshelfTileIDs
.loop
	ld a, [hli]
	cp $ff
	jr z, .noMatch
	cp b
	jr nz, .nextBookshelfEntry1
	ld a, [hli]
	cp c
	jr nz, .nextBookshelfEntry2
	ld a, [hl]
	push af
	call EnableAutoTextBoxDrawing
	pop af
	call PrintPredefTextID
.end
	xor a
	ldh [hInteractedWithBookshelf], a
	ret
.nextBookshelfEntry1
	inc hl
.nextBookshelfEntry2
	inc hl
	jr .loop
.noMatch
	ld a, $ff
	ldh [hInteractedWithBookshelf], a
	farjp PrintCardKeyText

INCLUDE "data/tilesets/bookshelf_tile_ids.asm"
