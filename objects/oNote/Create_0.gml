/// @description

FORGIVING_DST_PX = 96
did_thing = false
_did_attack_collision = false

POINTS_PL_HIT = 4
POINTS_PL_NEAR = 2
POINTS_PL_MISS = -2
POINTS_PL_MISS_NOPRESS = -4

POINTS_EN_HIT = -15
POINTS_EN_MISS_NOHIT = 0.2

_disable_player_action = false


switch (note_type) {
	case NoteType.PLAYER: sprite_index = note1; x += oNoteSpawner.x_timing_offset * 5
	break
	case NoteType.ENEMY: sprite_index = note2; x += oNoteSpawner.x_timing_offset * 5
	break
	case NoteType.RELOAD: sprite_index = note1; x += oNoteSpawner.x_timing_offset * 5
	break
	case NoteType.SCALE_WHOLE_TONE: sprite_index = spr_whole_tone; image_xscale = 0.5; image_yscale = 0.5; x += oNoteSpawner.x_timing_offset * 5
	break
	case NoteType.SCALE_MAJOR: sprite_index = spr_major; image_xscale = 0.5; image_yscale = 0.5; x += oNoteSpawner.x_timing_offset * 5
	break
	case NoteType.SCALE_MINOR: sprite_index = spr_minor; image_xscale = 0.5; image_yscale = 0.5; x += oNoteSpawner.x_timing_offset * 5
	break
	case NoteType.SCALE_CHROMATIC: sprite_index = spr_chromatic; image_xscale = 0.5; image_yscale = 0.5; x += oNoteSpawner.x_timing_offset * 5
	break
	case NoteType.SCALE_PENTATONIC: sprite_index = spr_pentatonic; image_xscale = 0.5; image_yscale = 0.5; x += oNoteSpawner.x_timing_offset * 5
	break
	case NoteType.BEAT_PULSE: sprite_index = note1; image_alpha = 0
	break
	case NoteType.BEAT_TACT: sprite_index = linia_taktowa_biala; x += oNoteSpawner.x_timing_offset * 5
	break
}