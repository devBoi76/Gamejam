/// @description

if (enemy_obj == noone) {
	show_message("BRAK WYBRANEGO PRZECIWNIKA W oNoteSpawner!!!")
}

if (enemy_music == noone) {
	show_message("BRAK WYBRANEGO ENEMY MUSIC W oNoteSpawner!!!")	
}

if (hero_music == noone) {
	show_message("BRAK WYBRANEGO HERO MUSIC W oNoteSpawner!!!")	
}

if (send_back_room == noone) {
	show_message("BRAK WYBRANEGO SEND BACK ROOM W oNoteSpawner!!!")	
}


show_debug_message("CREATE_NOTE_SPAWNER")

var _csv = load_csv(csv_note_file)
var _ds_w = ds_grid_width(_csv)
var _ds_h = ds_grid_height(_csv)

notes = array_create(_ds_h - 1, {})

for (var i = 1; i < _ds_h; i += 1) {
	notes[i-1] = {
		idx: real(_csv[# 0, i]),
		note: _csv[# 1, i],
		octave: real(_csv[# 2, i]),
		start_sec: real(_csv[# 3, i]),
	}
	show_debug_message(notes[i-1])
}

last_played_idx = 0

player_pos_perc = 0.1984
player_pos = player_pos_perc * sprite_width

var TRACK_W = (1 - player_pos_perc) * sprite_width
NOTE_SPEED_PX_PER_SEC = 600
note_sec_in_advance = TRACK_W / NOTE_SPEED_PX_PER_SEC

fight_has_started = not prefight_chat
audio_started = false
start_time = 0

end_time = 0

note_percs = [0.1121, 0.3076, 0.5, 0.6942, 0.8831]
note_positions = [0, 0, 0, 0, 0]

note_clicked_this_frame = false
last_player_note_missed = false

note_indexes = []
for (var i = 0; i < 5; i += 1) {
	array_push(note_indexes, ds_queue_create())
}

//for (var i = 0; i < array_length(note_percs); i += 1) {
	//note_positions[i] = note_percs * sprite_height	
//}

player_confidence = 0

if (prefight_chat) {
	alarm[0] = 20	
}

gui_win_loose_x = 640
gui_win_loose_y = 64

hero_audio = 0
sync_group = audio_create_sync_group(false)