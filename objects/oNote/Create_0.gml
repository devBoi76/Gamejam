/// @description

FORGIVING_DST_PX = 96
did_thing = false
_did_attack_collision = false

POINTS_PL_HIT = 4
POINTS_PL_NEAR = 2
POINTS_PL_MISS = -2
POINTS_PL_MISS_NOPRESS = -4

POINTS_EN_HIT = -5
POINTS_EN_MISS_NOHIT = 0.2


switch (note_type) {
	case NoteType.PLAYER: sprite_index = note1
	break
	case NoteType.ENEMY: sprite_index = note2
	break
	case NoteType.RELOAD: sprite_index = note1
}