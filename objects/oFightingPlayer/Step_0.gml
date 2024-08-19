/// @description

y = lerp(y, goto_y, 0.7)
y -= (sin( current_time * 0.002 ) * 0.01) * sprite_height
image_yscale = default_scale + (sin( current_time * 0.002 ) * 0.01)
