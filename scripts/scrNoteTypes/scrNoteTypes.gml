// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
enum NoteType {
	PLAYER,
	ENEMY,
	RELOAD,
}

function note_index_pressed(idx) {
	switch(idx) {
		case 4: return keyboard_check_pressed(ord("A")) or keyboard_check_pressed(ord("Q"))
		case 3: return keyboard_check_pressed(ord("S")) or keyboard_check_pressed(ord("W"))
		case 2: return keyboard_check_pressed(ord("D")) or keyboard_check_pressed(ord("E"))
		case 1: return keyboard_check_pressed(ord("F")) or keyboard_check_pressed(ord("R"))
		case 0: return keyboard_check_pressed(vk_space)
	}
}