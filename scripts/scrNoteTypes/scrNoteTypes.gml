// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
enum NoteType {
	SCALE_WHOLE_TONE = 0,
	SCALE_MAJOR = 1,
	SCALE_MINOR = 2,
	SCALE_CHROMATIC = 3,
	SCALE_PENTATONIC = 4,
	PLAYER = 5,
	ENEMY = 6,
	RELOAD = 7,
	BEAT_PULSE = 8,
	BEAT_TACT = 9,
}

function note_index_pressed(idx) {
	switch(idx) {
		case 0: return keyboard_check_pressed(ord("L")) or keyboard_check_pressed(ord("Q"))
		case 1: return keyboard_check_pressed(ord("K")) or keyboard_check_pressed(ord("W"))
		case 2: return keyboard_check_pressed(ord("J")) or keyboard_check_pressed(ord("E"))
		case 3: return keyboard_check_pressed(ord("H")) or keyboard_check_pressed(ord("R"))
		case 4: return keyboard_check_pressed(vk_space)
	}
}