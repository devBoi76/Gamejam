/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
is_on = global.save.levers[index];

if(is_on)
{
	height = clamp(height + opening_speed , 0 , sprite_get_height(sprite_index));
	if(height == sprite_get_height(sprite_index))
	{  audio_pause_sound(sound); };
}
else
{
	height = clamp(height - opening_speed , 0 , sprite_get_height(sprite_index));
	if(height == 0)
	{ audio_stop_sound(sound);
		sound = audio_play_sound(snd_doors , 1 , true);
		audio_pause_sound(sound);
	}
}

if(was_on != is_on)
{
	audio_pause_sound(sound);
	audio_resume_sound(sound);
}

update(close(height));

was_on = is_on;