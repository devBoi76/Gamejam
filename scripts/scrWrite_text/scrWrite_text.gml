/// @function			write_text(_x,_y,_text,_is_writing,_char_per_line,_font1,_font2);
/// @arg {real} _x					x position of a text
/// @arg {real} _y					y position of a text
/// @arg {string} _text				text to write
/// @arg {bool} _is_anim			is text animated
/// @arg {real} _px_per_line		max pixels per line
/// @arg {real} _anim_progress		animation progress
/// @arg {real} _anim_speed			animation speed (1=default)
/// @arg {asset} _font2				secondary font
/// @arg {real} _sep				space between lines of text
/// @description		Display text.

function write_text(_x,_y,_text,_is_anim,_px_per_line,_anim_progress=-1, _anim_speed=1,_font2 = fDefault, _sep=35){
	var _dl = string_length(_text);
	var _displayed_text = _dl+1;
	var _text_offset = 0;
	var _y_offset = 0;
	var _x_final_change = 0;
	var _y_final_change = 0;
	var _org_color = draw_get_color();
	var _org_font = draw_get_font();
	var _scale = 1;
	var _font2_offset = 0;
	
	var _dont_break = false;
	
	//efekty
	var _is_waving = false;
	var _is_shaking = false;
	var _is_pulsing = false;
	var _wave_array = [0.00, 0.05, 0.10, 0.14, 0.16, 0.17, 0.16, 0.14, 0.10, 0.05, 0.00, -0.05, -0.10, -0.13, -0.16, -0.17, -0.16, -0.13, -0.10, -0.05, 0.00] //bardzo nie chcę liczyć sinusa, bo to trudne obliczenie dla kompa
	var _shake_array = [0, -2, 1, 2, 0, 1, -1, 0, 2, -1, 0, 0, -2, 1, 0, -1, 1, -2, 0, 2];
	var _is_rainbow = false;
	var _is_font2 = false;
	
	if _is_anim &&	_anim_progress != -1 {
		_displayed_text = floor(_anim_progress);
		_anim_progress += _anim_speed;
	}
	
	
	
	for (var i = 1; i <= _displayed_text; i += 1)	{
		var _current_char = string_char_at(_text,i);
		
		//Analiza znaku `
		if _current_char = "`"{
			if string_char_at(_text,i+1) == "W" {
				switch string_char_at(_text,i+2) {
					case "S":
						_is_waving = true;
					break;
					
					case "E":
						_is_waving = false;
					break;
				}
				_text = string_delete(_text,i,3);
				
			} else if string_char_at(_text,i+1) == "S" {
				switch string_char_at(_text,i+2) {
					case "S":
						_is_shaking = true;
					break;
					
					case "E":
						_is_shaking = false;
					break;
				}
				_text = string_delete(_text,i,3);
				
			} else if string_char_at(_text,i+1) == "P" {
				switch string_char_at(_text,i+2) {
					case "S":
						_is_pulsing = true;
					break;
					
					case "E":
						_is_pulsing = false;
						_scale = 1;
					break;
				}
				_text = string_delete(_text,i,3);
				
			} else if string_char_at(_text,i+1) == "F" {
				switch string_char_at(_text,i+2) {
					case "S":
						_is_font2 = true;
					break;
					
					case "E":
						_is_font2 = false;
					break;
				}
				_text = string_delete(_text,i,3);
				
				
			} else if string_char_at(_text,i+1) == "R" {
				switch string_char_at(_text,i+2) {
					case "R":
						_scale = 1;
					break;
					
					case "0":
						_scale = 0.5;
					break;
					
					case "1":
						_scale = 0.8;
					break;
					
					case "2":
						_scale = 1.3;
					break;
					
					case "3":
						_scale = 2;
					break;
				}
				_text = string_delete(_text,i,3);
				
				
			} else if string_char_at(_text,i+1) == "N" {
				switch string_char_at(_text,i+2) {
					case "L":
						_text_offset += string_length(string_delete(string_delete(_text, i, 9999), 1,_text_offset));
						_y_offset += _sep;
						_font2_offset = 0;
					break;
					
					case "N":
						_is_waving = false;
					break;
				}
				_text = string_delete(_text,i,3);
				
			} else if string_char_at(_text,i+1) == "C" {
				switch string_char_at(_text,i+2) {
					case "S":
						switch string_char_at(_text,i+3) {
							case "0":
								draw_set_color(c_red);
							break;
							
							case "1":
								draw_set_color(c_lime);
							break;
							
							case "2":
								draw_set_color(c_blue);
							break;
							
							case "3":
								draw_set_color(c_yellow);
							break;
							
							case "4":
								draw_set_color(c_fuchsia);
							break;
							
							case "5":
								draw_set_color(c_aqua);
							break;
							
							case "6":
								draw_set_color(c_black);
							break;
							
							case "7":
								draw_set_color(c_white);
							break;
						}
						_text = string_delete(_text,i,4);
					break;
					
					case "C":
						draw_set_color(make_colour_rgb(hex_to_dec(string_concat(string_char_at(_text,i+3),string_char_at(_text,i+4))),hex_to_dec(string_concat(string_char_at(_text,i+5),string_char_at(_text,i+6))),hex_to_dec(string_concat(string_char_at(_text,i+7),string_char_at(_text,i+8)))));
						_text = string_delete(_text,i,9);
					break;
					
					case "R":
						draw_set_color(_org_color);
						_is_rainbow = false;
						_text = string_delete(_text,i,3);
					break;
					
					case "X":
						_is_rainbow = true;
						_text = string_delete(_text,i,3);
					break;
				}
			}
			i--;
		} else {
			var _current_text = string_delete(string_delete(_text, i, 9999), 1,_text_offset);
			
			draw_set_font(_org_font);
			_x_final_change = string_width(_current_text)
			_y_final_change = _y_offset;
			
			if _is_font2 {
				_font2_offset += string_width(_current_char);
				draw_set_font(_font2);
				_font2_offset -= string_width(_current_char);
			}		
			
			_x_final_change += _font2_offset;
		
			//Aplikowanie efektów do tekstu
			if _is_waving {
				_y_final_change += 20*_wave_array[(current_time/40+i)%20];
			}
			if _is_rainbow {
				draw_set_color(make_colour_hsv(((current_time/15)+(i*5))%255, 215, 245));
			}
			if _is_shaking {
				_y_final_change += _shake_array[(current_time/80+(i*5))%20];
				_x_final_change += _shake_array[(current_time/70+(i*6))%20];
			}
			if _is_pulsing {
				_scale = 1+_wave_array[(current_time/40)%20]
			}
			
			_y_final_change += (string_height(_current_char)-string_height(_current_char)*_scale)/2;
			_x_final_change += (string_width(_current_char)-string_width(_current_char)*_scale)/2;
			//łamanie tekstu
			if (_current_char = " " && string_width(string_delete(string_delete(_text, string_pos_ext(" ", _text, i+1), 9999), 1,_text_offset))>_px_per_line){
				_text_offset += string_length(_current_text)+1;
				_y_offset += _sep;
				_font2_offset = 0;
			}
			
			//draw_text(_x+_x_final_change,_y+_y_final_change,_current_char);
			draw_text_transformed(_x+_x_final_change,_y+_y_final_change,_current_char, _scale, _scale,0);
		}
	}
	if _displayed_text == _dl-1 {
		_anim_progress = -1;
	}
	draw_set_color(_org_color);
	return _anim_progress
}

function new_anim(_anim_progress){
	_anim_progress = 0;
	return _anim_progress
}

function end_anim(_anim_progress){
	_anim_progress = -1;
	return _anim_progress
}

function hex_to_dec(hex) 
{
    var dec = 0;
 
    var dig = "0123456789ABCDEF";
    var len = string_length(hex);
    for (var pos = 1; pos <= len; pos += 1) {
        dec = dec << 4 | (string_pos(string_char_at(hex, pos), dig) - 1);
    }
 
    return dec;
}