_SSAnneCaptainsRoomRubCaptainsBackText::
	text "Captain: Ooargh..."
	line "I feel hideous..."
	cont "Urrp! Seasick..."

	para "<PLAYER> rubbed"
	line "the Captain's"
	cont "back!"

	para "Rub-rub..."
	line "Rub-rub...@"
	text_end

_SSAnneCaptainsRoomCaptainIFeelMuchBetterText::
	text "Captain: Whew!"
	line "Thank you! I"
	cont "feel much better!"

	para "You want to see"
	line "my Cut technique?"

	para "I could show you"
	line "if I wasn't ill..."

	para "I know! You can"
	line "have this!"

	para "Teach it to your"
	line "#mon and you"
	cont "can see it Cut"
	cont "anytime!"
	prompt

_SSAnneCaptainsRoomCaptainReceivedHM01Text::
	text "<PLAYER> got"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end

_SSAnneCaptainsRoomCaptainNotSickAnymoreText::
	text "Captain: Whew!"

	para "Now that I'm not"
	line "sick anymore, I"
	cont "guess it's time."
	done

_SSAnneCaptainsRoomCaptainHM01NoRoomText::
	text "Oh no! You have"
	line "no room for this!"
	done

_SSAnneCaptainsRoomTrashText::
	text "Yuck! Shouldn't"
	line "have looked!"
	done

_SSAnneCaptainsRoomSeasickBookText::
	text "How to Conquer"
	line "Seasickness..."
	cont "The Captain's"
	cont "reading this!"
	done
