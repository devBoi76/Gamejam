// W wersji v2.3.0 zmieniono zasoby skryptu. Więcej informacji można znaleźć pod adresem
// https://help.yoyogames.com/hc/en-us/articles/360005277377
function textbox_create(_npc_id , _player_id , my_x , my_y ) constructor
{
	_x = my_x;
	_y = my_y;
	npc_id = _npc_id;
	player_id = _player_id;
	current_text = -1;
	animation_progress = 0;
	appear = 0;
	appearing_speed = 0.05;
	is_ended = false;
	
	
	dialog_array = array_create(array_length(global.lang.npc[npc_id].dialogs));
	for( var _i = 0 ; _i < array_length(dialog_array) ; _i++ )
	{
		dialog_array[_i] = global.lang.npc[npc_id].dialogs[_i];
	}
	
	static draw_dialog = function(textbox_sprite)
	{
		draw_sprite_ext(textbox_sprite , -1 , _x + ( (sprite_get_width(textbox_sprite) - sprite_get_width(textbox_sprite) * appear) / 2 ) , _y + ( (sprite_get_height(textbox_sprite) - sprite_get_height(textbox_sprite) * appear) / 2 ), appear , appear , 0 , c_white , appear );
		if( ! (current_text == -1) )
		{
			if(appear == 1)
			{
				animation_progress = write_text( _x , _y , dialog_array[current_text] , true , sprite_get_width(textbox_sprite) , animation_progress ) ;
			}
		}
	}
	
	static next_dialog = function()
	{
		if(animation_progress == -1 || current_text == -1)
			{
			if(current_text + 1 >= array_length(dialog_array))
			{
				is_ended = true;
				current_text = -1;
			}
			else if( string_char_at( dialog_array[current_text + 1] , 1) == "`" && string_char_at( dialog_array[current_text + 1] , 2) == "X" )
			{
				is_ended = true;
				start_fight( player_id , asset_get_index(string_delete(dialog_array[current_text + 1] , 1 , 2)));
				current_text = -1;
			}
			else
			{
				is_ended = false;
				animation_progress = 0;
				current_text++;
			}			
		}
		else
		{
			animation_progress = -1;
		}	
	}
	
	static dialog_appear = function()
	{
		if(current_text != -1)
		{
			appearing_speed = abs(appearing_speed) * 1;
			appear = clamp( appear + appearing_speed , 0 , 1);
		}
		else
		{
			appearing_speed = abs(appearing_speed) * -1;
			appear = clamp( appear + appearing_speed , 0 , 1);
			if(appear == 0)
			{
				current_text = -1;
				is_ended = false;
			}
		}
	}
	
}

function start_fight( _player_id , _fight_room)
{
	if("obj_player_test" = object_get_name(_player_id.object_index))
	{
	_player_id.can_move = false;
	}
	
	_fading_id = instance_create_depth( 0 , 0 , -999 , obj_fading_room);
	_fading_id.target_room = _fight_room;
	_fading_id.is_fading = true;
	global.target.x = 330;
	global.target.y = 450;
}