// W wersji v2.3.0 zmieniono zasoby skryptu. Więcej informacji można znaleźć pod adresem
// https://help.yoyogames.com/hc/en-us/articles/360005277377
function try_move_x( _x_speed , _player_width , _player_height )
{
	var _sign = sign(_x_speed);
	_player_width = ( (_player_width / 2) + _sign * (_player_width / 2) );
	
	tile = array_create( 5 );
	
	for( var _a = 4 ; _a >= 0 ; _a-- )
	{
		tile[_a] = tile_get_empty( tilemap_get_at_pixel( global.tilemap_hitbox_id , x + _x_speed + _player_width, y + ( _player_height / 4 ) * _a ) );
	}
	
	if( tile[0] && tile[1] && tile[2] && tile[3] && tile[4])
	{
		return( _x_speed );
	}
	else
	{
		x = floor(x);
		
		for( var i = 0 ; ( i < abs(_x_speed) + 1 && i > - abs(_x_speed) - 1) ; i = i + _sign )
		{
			
			for( var _a = 4 ; _a >= 0 ; _a-- )
			{
				tile[_a] = tile_get_empty( tilemap_get_at_pixel( global.tilemap_hitbox_id , x + i + _player_width, y + ( _player_height / 4 ) * _a ) );
			}
			
			if( ! ( tile[0] && tile[1] && tile[2] && tile[3] && tile[4]) )
			{
				return( i - _sign );
			}
		}
		
	}
	return 0;
}