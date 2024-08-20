/// @description

if (image_index >= image_number) {
	sprite_index = spr_postac_walka_stoi
}

y = lerp(y, goto_y, 0.7)

image_xscale = lerp(image_xscale, 1, 0.35)
image_yscale = lerp(image_yscale, 1, 0.35)
image_angle = lerp(image_angle, 0, 0.35)
//y_off = lerp(y_off, 0, 0.35)

if pulse {
	//y_off = -sprite_height * 0.1
	image_yscale = 1.17
	image_xscale = 1.17
	pulse = false
}