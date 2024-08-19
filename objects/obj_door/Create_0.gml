/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod
is_on = global.save.levers[index];
if(is_on){height = sprite_get_height(sprite_index)}
else{height = 0}
opening_speed = 5;

function close(_height)
{
	var closing_stage = floor( _height / 30 )
	return closing_stage;
}
//(sprite_get_height(sprite_index) / 30)
function update(_closing_stage)
{
	global.tilemap_hitbox_id = layer_tilemap_get_id(layer_get_id("Tiles_Hitbox"));
	for( var _i = 0 ; _i < (sprite_get_height(sprite_index) / 30)  ; _i ++)
	{
		var _tile = tilemap_get_at_pixel( global.tilemap_hitbox_id , x + (sprite_get_width(sprite_index) / 2)  , y + sprite_get_height(sprite_index) - 15 - 30 * _i );
		if(_i >= _closing_stage)
		{ _tile = tile_set_index( _tile , 1)}
		else
		{ _tile = tile_set_index(_tile, 0) }
		tilemap_set_at_pixel(global.tilemap_hitbox_id , _tile , x + (sprite_get_width(sprite_index) / 2)  , y + sprite_get_height(sprite_index) - 15 - 30 * _i  );
	}
}