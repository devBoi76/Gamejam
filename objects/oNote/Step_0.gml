/// @description Insert description here
// You can write your code in this editor

x -= delta_time * note_speed_px_per_sec / 1_000_000

var is_first = ds_queue_head(oNoteSpawner.note_indexes[note_index]) == id

var is_first_enabled = true

var _tmp_queue = ds_queue_create()

while (ds_queue_size(oNoteSpawner.note_indexes[note_index]) > 0) {
	var _head = ds_queue_dequeue(oNoteSpawner.note_indexes[note_index])
	if not _head._disable_player_action and _head != id {
		is_first_enabled = false
	}
}

while (ds_queue_size(_tmp_queue)) {
	var _head = ds_queue_dequeue(_tmp_queue)
	ds_queue_enqueue(oNoteSpawner.note_indexes[note_index], _head)
}

ds_queue_destroy(_tmp_queue)

var _pp = oNoteSpawner.player_pos

switch (note_type) {
	case NoteType.PLAYER:	
		if is_first_enabled and not oNoteSpawner.note_clicked_this_frame and not _disable_player_action and not did_thing and oNoteSpawner.note_index_positions[note_index]
			and (keyboard_check_pressed(vk_space) or mouse_check_button_pressed(mb_left)) {
			if (abs(_pp - x) <= FORGIVING_DST_PX / 2) {
				show_debug_message("WAVE!!!")
				audio_play_sound(choose(hit0, hit1, hit2), 2, false, 1.5)
				did_thing = true
				oNoteSpawner.player_confidence += POINTS_PL_HIT
				
				oNoteSpawner.last_player_note_missed = false
				oNoteSpawner.note_clicked_this_frame = true
				
				oFightingPlayer.sprite_index = spr_postac_walka_atak
				oFightingPlayer.alarm[0] = oFightingPlayer.sprite_change_delay
				oFightingPlayer.changed_sprite = true
				
				sprite_index = note1_onhit
				instance_create_layer(x, y, "notes_and_player", oOdbicie)
			} else if (abs(_pp - x) <= FORGIVING_DST_PX) {
				show_debug_message("slight_miss")
				audio_play_sound(choose(hit0, hit1, hit2), 2, false, 1.5)
				oNoteSpawner.player_confidence += POINTS_PL_NEAR
				
				did_thing = true
				oNoteSpawner.last_player_note_missed = false
				oNoteSpawner.note_clicked_this_frame = true
				
				oFightingPlayer.sprite_index = spr_postac_walka_atak
				oFightingPlayer.alarm[0] = oFightingPlayer.sprite_change_delay
				oFightingPlayer.changed_sprite = true
				
				sprite_index = note1_onhit
				instance_create_layer(x, y, "notes_and_player", oOdbicie, {
					image_xscale: 0.75,
					image_yscale: 0.75,
				})
			}
			//else if (abs(_pp - x) <= FORGIVING_DST_PX * 2) {
				//show_debug_message("miss")
				//oNoteSpawner.player_confidence += POINTS_PL_MISS
				
				//did_thing = true
				//oNoteSpawner.last_player_note_missed = true
				//oNoteSpawner.note_clicked_this_frame = true
			//}
			else {}

		}
	break
	case NoteType.ENEMY:
		if (place_meeting(x, y, oFightingPlayer) and not did_thing) {
			show_debug_message("HIT!")
			audio_play_sound(choose(damage0, damage1, damage2), 2, false, 1.5)
			did_thing = true
			oNoteSpawner.player_confidence += POINTS_EN_HIT
			
			oFightingPlayer.sprite_index = spr_postac_walka_obrazenia
			oFightingPlayer.alarm[0] = oFightingPlayer.sprite_change_delay
			oFightingPlayer.changed_sprite = true
		}
		if (place_meeting(x, y, oAttackCollider) and not _did_attack_collision) {
			show_debug_message("oAttackCollider")
			oNoteSpawner.enemy_obj.do_attack = true
			_did_attack_collision = true
		}
	break
	case NoteType.RELOAD:
		if (place_meeting(x, y, oFightingPlayer) and not did_thing) {
			show_debug_message("RELOAD!")
			did_thing = true
			
			oFightingPlayer.sprite_index = spr_postac_walka_start
			oFightingPlayer.alarm[0] = oFightingPlayer.sprite_change_delay
		}
	break
	case NoteType.SCALE_WHOLE_TONE:
	case NoteType.SCALE_MAJOR:
	case NoteType.SCALE_MINOR:
	case NoteType.SCALE_CHROMATIC:
	case NoteType.SCALE_PENTATONIC:
		if (place_meeting(x, y, oFightingPlayer) and not did_thing) {
			show_debug_message(did_thing)
			global.save.current_scale = note_type
			show_debug_message("HIT SCALE " + string(note_type))
			did_thing = true
		}
	break
	
	case NoteType.BEAT_PULSE:
		if (place_meeting(x, y, oPulser)) {
			oPulser.start = true
			oFightingPlayer.pulse = true
			oNoteSpawner.enemy_obj.pulse = true
		}
	break
}

if (place_meeting(x, y, oNoteDestroyer) or did_thing or (x < oNoteSpawner.player_pos_perc * oNoteSpawner.sprite_width - FORGIVING_DST_PX * 2))
	and is_first_enabled {
	ds_queue_dequeue(oNoteSpawner.note_indexes[note_index])
}

if (place_meeting(x, y, oNoteDisabler)) {
	_disable_player_action = true	
}