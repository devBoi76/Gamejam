/// @description
draw_self()
draw_sprite_ext(postac_hitbox, 0, x, y, image_xscale, image_yscale, 0, c_white, 0.25)

if (get_timer() < invincible_until) {
	draw_sprite_ext(spr_bubble, 0, x, y, image_xscale, image_yscale, 0, c_white, 1)
}