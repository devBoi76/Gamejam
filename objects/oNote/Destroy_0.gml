/// @description

if not did_thing {
	switch(note_type) {
		case NoteType.ENEMY:
			oNoteSpawner.player_confidence += POINTS_EN_MISS_NOHIT
			break
		case NoteType.PLAYER:
			oNoteSpawner.player_confidence += POINTS_PL_MISS_NOPRESS
			oNoteSpawner.last_player_note_missed = true
			break
	}
}