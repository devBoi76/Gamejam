/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
sprite_index = asset_get_index(global.lang.npc[index].sprite);
want_talk = false;
attention_distance = 50;
stretch = 0;
random_i = 0;

attention_variable = 0;

dialogs_array = array_create(array_length(global.lang.npc[index].dialogs));

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