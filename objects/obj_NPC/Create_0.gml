/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
sprite_index = asset_get_index(global.lang.npc[index].sprite);
show_debug_message(global.lang.npc[index])
if struct_exists(global.lang.npc[index], "sprite_scale") {
	image_xscale = global.lang.npc[index].sprite_scale
	image_yscale = global.lang.npc[index].sprite_scale
}



started_dialog = false
attention_distance = 50;
stretch = 0;
random_i = 0;
enemy_status_defeated = false;

attention_variable = 0;

dialogs_array = array_create(array_length(global.lang.npc[index].dialogs));

start_force_talking = false
ignore_distance = false
block_manual_start = false

for( var _i = 0 ; _i < array_length(dialogs_array) ; _i++ )
{
	dialogs_array[_i] = global.lang.npc[index].dialogs[_i];
}

my_textbox = new textbox_create( index , instance_nearest( x , y , obj_player_test) , 50 , 50 , 10 );


function attention( _on)
{
	if(_on == true)
	{
		other.attention_variable = clamp(other.attention_variable + 0.05 , 0 , 1);
	}
	else
	{
		other.attention_variable = clamp(other.attention_variable - 0.05 , 0 , 1);
	}
}

if( enemy_index > -1 )
{
	enemy_status_defeated = global.save.enemies[enemy_index];
}