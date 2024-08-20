// W wersji v2.3.0 zmieniono zasoby skryptu. Więcej informacji można znaleźć pod adresem
// https://help.yoyogames.com/hc/en-us/articles/360005277377
function textbox_create(_npc_id , _player_id , my_x , my_y , _margin = 0 , dialog_option = 0 ) constructor
{
	_x = my_x;
	_y = my_y;
	npc_id = _npc_id;
	player_id = _player_id;
	current_text = -1;
	animation_progress = 0;
	appear = 0;
	appearing_speed = 0.05;
	is_shown = true;
	name = global.lang.npc[npc_id].name;
	margin = _margin;
	is_over = false
	
	if( dialog_option > array_length(global.lang.npc[npc_id].dialogs) - 1) { dialog_option = 0; }
	
	dialog_array = array_create(array_length(global.lang.npc[npc_id].dialogs[dialog_option]));
	for( var _i = 0 ; _i < array_length(dialog_array) ; _i++ )
	{
		dialog_array[_i] = global.lang.npc[npc_id].dialogs[dialog_option][_i];
	}
	
	//// draws current dialog
	
	static draw_dialog = function(textbox_sprite , namebox_sprite)
	{
		if(is_shown)
		{
			draw_sprite_ext(textbox_sprite , -1 , _x + ( (sprite_get_width(textbox_sprite) - sprite_get_width(textbox_sprite) * appear) / 2 ) , _y + ( (sprite_get_height(textbox_sprite) - sprite_get_height(textbox_sprite) * appear) / 2 ), appear , appear , 0 , c_white , appear );
			if(name != "") draw_sprite_ext(namebox_sprite , -1 , _x + ( (sprite_get_width(textbox_sprite) - sprite_get_width(textbox_sprite) * appear) / 2 ) , _y + ( (sprite_get_height(textbox_sprite) - sprite_get_height(textbox_sprite) * appear) / 2 )  - ( ( sprite_get_height(namebox_sprite) / 2 ) * appear) , appear , appear , 0 , c_white , appear );
			if( ! (current_text == -1) && appear == 1)
			{
				draw_set_font(Font_dialogs);
					write_text( _x + margin , _y , name , false , sprite_get_width(namebox_sprite) - margin * 2);
					animation_progress = write_text( _x + margin, _y + ( sprite_get_height(namebox_sprite) / 2 ) + margin , dialog_array[current_text] , true , sprite_get_width(textbox_sprite) - 2 * margin , animation_progress ) ;
			}
		}
	}
	
	static start_dialog = function() {
		is_over = false	
	}
	static next_dialog = function()
	{
		if (is_over) {
			return
		}
		
		if(animation_progress == -1 || current_text == -1)
			{
				

			
			if(current_text >= array_length(dialog_array) - 1)
			{
				is_over = true
				current_text = -1;
			}
			else if( string_char_at( dialog_array[current_text + 1] , 1) == "`" && string_char_at( dialog_array[current_text + 1] , 2) == "X" )
			{
				start_fight( player_id , asset_get_index(string_delete(dialog_array[current_text + 1] , 1 , 2)));
				current_text = -1;
			} else if (dialog_array[current_text + 1] == "`FIGHT_NEXT_STAGE") {
				oNoteSpawner.fight_has_started = true
				is_over = true;
	
				if (instance_exists(oIntroText)) {
					oIntroText.start_anim = true
				}
				
				if (instance_exists(oIntroTextSmal)) {
					oIntroTextSmal.start_anim = true
				}
				current_text = - 1	
			}
			else if (dialog_array[current_text + 1] == "`SAVE_POINT")
			{
				global.save.write("save");
				current_text = - 1	;
			}
			else
			{
				animation_progress = 0;
				current_text++;
			}			
		}
		else
		{
			animation_progress = -1;
		}	
	}
	
	//// controls dilaog apperance
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
		}
	}
	
	//// minor function
	static dialog_turn_off = function() { current_text = -1; }
	static dilaog_hide = function() { is_shown = false; }
	static dilaog_show = function() { is_shown = true; }
	static dialog_set_name = function( _name )
	{
		name = "name";
	}
	static dialog_option_set = function( _number ) 
	{
			if( _number >= array_length(global.lang.npc[npc_id].dialogs) ) { return false; }
			else
			{
				dialog_option = _number;
				dialog_array = [];
				dialog_array = array_create(array_length(global.lang.npc[npc_id].dialogs[dialog_option]));
				for( var _i = 0 ; _i < array_length(dialog_array) ; _i++ )
				{
					dialog_array[_i] = global.lang.npc[npc_id].dialogs[dialog_option][_i]; 
				}
				current_text = -1;
				return true; 
			}
			
	}
}

function start_fight( _player_id , _fight_room , last_pos = true)
{
	if("obj_player_test" = object_get_name(_player_id.object_index))
	{
	_player_id.can_move = false;
	}

	if(last_pos) {
		global.last_player_pos.x = obj_player_test.x
		global.last_player_pos.y = obj_player_test.y
	}
	

room_fade(global.lang.npc[npc_id].goto_x, global.lang.npc[npc_id].goto_y, _fight_room);
}