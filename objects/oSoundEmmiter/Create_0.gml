/// @description

emitter = audio_emitter_create()
audio_falloff_set_model(audio_falloff_inverse_distance_clamped)
audio_emitter_position(emitter, x, y, 25)
audio_emitter_falloff(emitter, 50, 75, 1)
sound_id = audio_play_sound_on(emitter, sound, true, 1)

//sound_id = audio_play_sound_at(
	//sound, x, y, 0,
	//5, 10, 4,
	//true, 1)
