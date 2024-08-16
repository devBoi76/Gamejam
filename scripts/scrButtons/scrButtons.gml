function button_group() constructor{
	elements = [];
	is_clickable = true;
	clicked_element = -1;
	bx = 0;
	by = 0;
	
	static add_element = function(_x,_y,_name_id,_type,_value) {
		//types:
		//basic (single click button)
		//switch (two states: on and off)
		//slider (real values 0-100)
		//list (unique number of options)
		array_push(elements,[_x,_y,_name_id,_type,_value]);
	}
	
	static read_element = function(_name_id) {
	var _length = array_length(elements)
		for (var i = 0; i < _length; i += 1){
			if elements[i][2] == _name_id {
				return elements[i][4]
			}
		}
	}
		
	static disable = function(){
		is_clickable = false;
	}
	
	static enable = function(){
		is_clickable = true;
	}

	static draw = function(){
		var _length = array_length(elements)
		for (var i = 0; i < _length; i += 1){
			switch elements[i][3] {
				case "basic" :
					if elements[i][4] {
						draw_set_color(c_lime);
						draw_rectangle(bx+elements[i][0]-80,by+elements[i][1]-30,bx+elements[i][0]+80,by+elements[i][1]+30,true);
						draw_set_color(c_white);
						draw_text(bx+elements[i][0]-20, elements[i][1]-10,global.lang.buttons[$ elements[i][2]]);
					} else {
						draw_set_color(c_red);
						draw_rectangle(bx+elements[i][0]-80, by+elements[i][1]-30,bx+elements[i][0]+80, by+elements[i][1]+30,true);
						draw_set_color(c_white);
						draw_text(bx+elements[i][0]-20, by+elements[i][1]-10,global.lang.buttons[$ elements[i][2]]);
					}
				break;
				
				case "switch" :
					if elements[i][4] {
						draw_set_color(c_lime);
						draw_rectangle(elements[i][0]-80, elements[i][1]-30,elements[i][0]+80, elements[i][1]+30,false);
						draw_set_color(c_black);
						draw_text(elements[i][0]-20, elements[i][1]-10,"SWITCH: ON");
					} else {
						draw_set_color(c_red);
						draw_rectangle(elements[i][0]-80, elements[i][1]-30,elements[i][0]+80, elements[i][1]+30,false);
						draw_set_color(c_black);
						draw_text(elements[i][0]-20, elements[i][1]-10,"SWITCH: OFF");
					}
				break;
				
				case "slider" :
					draw_set_color(c_white);
					draw_text(elements[i][0], elements[i][1]-30,string("SLIDER: {0}",elements[i][4]));
					draw_line(elements[i][0]-80,elements[i][1],elements[i][0]+80,elements[i][1]);
					draw_circle(lerp(elements[i][0]-80,elements[i][0]+80,elements[i][4]/100),elements[i][1],5,false);
				break;
				
				case "list" :
					draw_set_color(c_white);
					draw_rectangle(elements[i][0]-80, elements[i][1]-30,elements[i][0]+80, elements[i][1]+30,true);
					draw_text(elements[i][0]-20, elements[i][1]-10,string("LIST: \n{0}",elements[i][4][1][elements[i][4][0]]));
					draw_triangle(elements[i][0]-85,elements[i][1]-30,elements[i][0]-85,elements[i][1]+30,elements[i][0]-100,elements[i][1], true);
					draw_triangle(elements[i][0]+85,elements[i][1]-30,elements[i][0]+85,elements[i][1]+30,elements[i][0]+100,elements[i][1], true);
				break;
			}
		}
	}
		
	static step = function(){
	if is_clickable {
		var _length = array_length(elements)
		for (var i = 0; i < _length; i += 1){
			switch elements[i][3] {
				case "basic" :
					if mouse_check_button_pressed(mb_left ) && point_in_rectangle(mouse_x,mouse_y,bx+elements[i][0]-80, by+elements[i][1]-30,bx+elements[i][0]+80, by+elements[i][1]+30) {
						elements[i][4] = true;
					} else {
						elements[i][4] = false;
					}
				break;
				
				case "switch" :
					if mouse_check_button_pressed(mb_left ) && point_in_rectangle(mouse_x,mouse_y,elements[i][0]-80, elements[i][1]-30,elements[i][0]+80, elements[i][1]+30) {
						elements[i][4] = !elements[i][4];
					}
				break;
				
				case "slider" :
					draw_text(elements[i][0], elements[i][1],"SLIDER");
					if mouse_check_button(mb_left) && point_in_rectangle(mouse_x,mouse_y,elements[i][0]-90, elements[i][1]-30,elements[i][0]+90, elements[i][1]+30) {
						elements[i][4] = clamp(mouse_x-(elements[i][0]-80),0,160)/1.6
					}
				break;
				
				case "list" :
					if mouse_check_button_pressed(mb_left) && point_in_rectangle(mouse_x,mouse_y,elements[i][0]-100, elements[i][1]-30,elements[i][0]-80, elements[i][1]+30) {
						if elements[i][4][0] != 0 {
							elements[i][4][0] = elements[i][4][0] - 1;
						} else {
							elements[i][4][0] = array_length(elements[i][4][1])-1;
						};
					} else if mouse_check_button_pressed(mb_left) && point_in_rectangle(mouse_x,mouse_y,elements[i][0]+80, elements[i][1]-30,elements[i][0]+100, elements[i][1]+30) {
						elements[i][4][0] = (elements[i][4][0] + 1) % array_length(elements[i][4][1]);
					}
				break;
			}
		}
	}
	}
			
}