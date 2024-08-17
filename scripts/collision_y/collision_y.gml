// W wersji v2.3.0 zmieniono zasoby skryptu. Więcej informacji można znaleźć pod adresem
// https://help.yoyogames.com/hc/en-us/articles/360005277377
function try_move_y(_y_speed , _player_width , _player_height )
{
	var _sign = sign(_y_speed);
	_player_height = (_player_height / 2) + _sign * (_player_height / 2);
	var _tile_left = tilemap_get_at_pixel( global.tilemap_hitbox_id , x , y + _y_speed + _player_height);
	var _tile_right = tilemap_get_at_pixel( global.tilemap_hitbox_id , x + _player_width , y + _y_speed + _player_height);
	
	if( tile_get_empty(_tile_left) && tile_get_empty(_tile_right))
	{
		other.failing = true;
		return( _y_speed );
	}
	else
	{
		y = floor(y);
		
		for( var i = 0 ; (i < abs(_y_speed) + 1 && i > - abs(_y_speed) -1 ) ; i = i + _sign )
		{
			
			_tile_left = tilemap_get_at_pixel( global.tilemap_hitbox_id , x , y + i + _player_height );
			_tile_right = tilemap_get_at_pixel( global.tilemap_hitbox_id , x + _player_width , y + i + _player_height );
			
			if( ! (tile_get_empty(_tile_left) && tile_get_empty(_tile_right)) )
			{
				
				other.failing = !(bool ( _sign + 0.5 ));
				
				return( i - _sign );
			}
		}
		
	}
	return 0;
}