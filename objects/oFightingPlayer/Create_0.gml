/// @description

position_index = 4
note_percs = [0.1121, 0.3076, 0.5, 0.6942, 0.8831]
goto_y = note_percs[4] * oNoteSpawner.sprite_height + 35
oNoteSpawner.note_index_positions[4] = true

sprite_change_delay = 20
changed_sprite = false
default_scale = image_yscale

current_scale = NoteType.SCALE_WHOLE_TONE

pulse = false

attack_rotation_step = 0
attack_rotations = [-40, 40]

invincible_until = 0
