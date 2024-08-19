/// @description

var _gain = audio_emitter_get_gain(emitter)
show_debug_message("gain " + string(_gain))
if (_gain <= 0) {
	instance_destroy(id)
	return
} else {
	audio_emitter_gain(emitter, _gain - 1)
	alarm[0] = 3
}