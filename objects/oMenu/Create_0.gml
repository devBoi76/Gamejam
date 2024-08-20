menu = new button_group();
var xseparation = 250;
var yseparation = 70;
var down = 400;

menu.add_element(room_width/2 - xseparation, room_height/2 - yseparation + down ,"continue","basic",false);
menu.add_element(room_width/2 + xseparation, room_height/2  + yseparation + down ,"reset_game","basic",false);
menu.add_element(room_width/2 - xseparation, room_height/2 + yseparation + down ,"settings","basic",false);
menu.add_element(room_width/2 + xseparation, room_height/2 - yseparation + down ,"exit_game","basic",false);