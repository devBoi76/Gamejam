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


if not did_thing and not _disable_player_action and
	note_type == NoteType.PLAYER and (place_meeting(x, y, oNoteMusicMuter)) {
	oNoteSpawner.last_player_note_missed = true
}

switch (note_type) {
	case NoteType.PLAYER:	
		if is_first_enabled and not oNoteSpawner.note_clicked_this_frame and not _disable_player_action and not did_thing and oNoteSpawner.note_index_positions[note_index]
			and (keyboard_check_pressed(vk_space) or mouse_check_button_pressed(mb_left)) {
			if (abs(_pp - x) <= FORGIVING_DST_PX / 2) {
				show_debug_message("WAVE!!!")
				audio_play_sound(choose(hit0, hit1, hit2), 2, false, 1.5)
				did_thing = true
				impact_frame_visible = true
				alarm[0] = 15
				oNoteSpawner.player_confidence += POINTS_PL_HIT
				
				oNoteSpawner.last_player_note_missed = false
				oNoteSpawner.note_clicked_this_frame = true
				
				oFightingPlayer.sprite_index = spr_postac_walka_atak
				oFightingPlayer.alarm[0] = oFightingPlayer.sprite_change_delay
				oFightingPlayer.changed_sprite = true
				oFightingPlayer.image_angle = oFightingPlayer.attack_rotations[oFightingPlayer.attack_rotation_step]
				//oFightingPlayer.attack_rotation_step = (oFightingPlayer.attack_rotation_step + 1) % array_length(oFightingPlayer.attack_rotations)

				
				sprite_index = note1_onhit
				instance_create_layer(x, y, "notes_and_player", oOdbicie)
			} else if (abs(_pp - x) <= FORGIVING_DST_PX) {
				show_debug_message("slight_miss")
				audio_play_sound(choose(hit0, hit1, hit2), 2, false, 1.5)
				oNoteSpawner.player_confidence += POINTS_PL_NEAR
				did_thing = true
				impact_frame_visible = true
				alarm[0] = 15
				
				oNoteSpawner.last_player_note_missed = false
				oNoteSpawner.note_clicked_this_frame = true
				
				oFightingPlayer.sprite_index = spr_postac_walka_atak
				oFightingPlayer.alarm[0] = oFightingPlayer.sprite_change_delay
				oFightingPlayer.changed_sprite = true
				
				oFightingPlayer.image_xscale = 0.9
				oFightingPlayer.image_yscale = 0.9
				
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
			if (get_timer() < oFightingPlayer.invincible_until) {
				did_thing = true
				break	
			}
			
			oFightingPlayer.invincible_until = get_timer() + 0.25 * 1_000_000
			show_debug_message("HIT!")
			audio_play_sound(choose(damage0, damage1, damage2), 2, false, 1.5)
			did_thing = true
			sprite_index = note2_hit
			image_angle = random_range(-45, 45)
			
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
		POINTS_EN_HIT = -15
		POINTS_PL_HIT = 4
		POINTS_PL_NEAR = 2
		oNoteSpawner.easier_mode = false
		if (place_meeting(x, y, oFightingPlayer) and not did_thing) {
			show_debug_message(did_thing)
			global.save.current_scale = note_type
			show_debug_message("HIT SCALE " + string(note_type))
			did_thing = true
			oFightingPlayer.sprite_index = spr_postac_walka_start
			oFightingPlayer.alarm[0] = oFightingPlayer.sprite_change_delay
			oFightingPlayer.image_index = 0
			oFightingPlayer.image_speed = 1
		
			switch(note_type) {
				case NoteType.SCALE_WHOLE_TONE:
					oFightingPlayer.invincible_until = get_timer() + 10 * 1_000_000
					break
				case NoteType.SCALE_MINOR:
					POINTS_EN_HIT = -7
					break
				case NoteType.SCALE_MAJOR:
					POINTS_PL_HIT = 8
					POINTS_PL_NEAR = 4
					break
				case NoteType.SCALE_PENTATONIC:
					oNoteSpawner.player_confidence += 45
					break
				case NoteType.SCALE_CHROMATIC:
					oNoteSpawner.easier_mode = true
			}
		}
	break
	
	case NoteType.BEAT_PULSE:
		if (place_meeting(x, y, oPulser)) {
			oPulser.start = true
			oFightingPlayer.pulse = true
			oNoteSpawner.enemy_obj.pulse = true
			oWaga.angle_off = oFightingPlayer.attack_rotations[oFightingPlayer.attack_rotation_step] / 10
			if not _disable_player_action {
				//oFightingPlayer.image_angle = oFightingPlayer.attack_rotations[oFightingPlayer.attack_rotation_step] / 3
				oFightingPlayer.attack_rotation_step = (oFightingPlayer.attack_rotation_step + 1) % array_length(oFightingPlayer.attack_rotations)
				_disable_player_action = true
			}
		}
	break
}

if (place_meeting(x, y, oNoteDestroyer) or (did_thing and note_type != NoteType.PLAYER))// or (x < oNoteSpawner.player_pos_perc * oNoteSpawner.sprite_width - FORGIVING_DST_PX * 2))
	and is_first_enabled {
	ds_queue_dequeue(oNoteSpawner.note_indexes[note_index])
	instance_destroy(id)
}

if (place_meeting(x, y, oNoteDisabler)) {
	_disable_player_action = true	
}
