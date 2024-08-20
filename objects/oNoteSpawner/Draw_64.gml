var _spr_idx = noone
switch(global.save.current_scale) {
	case NoteType.SCALE_WHOLE_TONE:
		_spr_idx = spr_whole_tone
		break
	case NoteType.SCALE_MAJOR:
		_spr_idx = spr_major
		break
	case NoteType.SCALE_MINOR:
		_spr_idx = spr_minor
		break
	case NoteType.SCALE_CHROMATIC:
		_spr_idx = spr_chromatic
		break
	case NoteType.SCALE_PENTATONIC:
		_spr_idx = spr_pentatonic
		break
}

draw_sprite_ext(_spr_idx, 0, x + 1200, 100, 0.5, 0.5, 0, c_white, 1)