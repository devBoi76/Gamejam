// W wersji v2.3.0 zmieniono zasoby skryptu. Więcej informacji można znaleźć pod adresem
// https://help.yoyogames.com/hc/en-us/articles/360005277377
function try_move_x( _x_speed , _player_width , _player_height )
{
	var _sign = sign(_x_speed);
	_player_width = ( (_player_width / 2) + _sign * (_player_width / 2) );
	
	tile = array_create( (hitbox_height / global.universal_constant) + 1);
	
	tiles_fill( tile , _x_speed , _player_width , _player_height );
	
	if( check( tile , true ) )
	{
		return( _x_speed );
	}
	else
	{
		x = floor(x);
		
		for( var i = 0 ; ( i < abs(_x_speed) + 1 && i > - abs(_x_speed) - 1) ; i = i + _sign )
		{
			
			tiles_fill( tile , i , _player_width , _player_height );
			
			if( ! check( tile , true ) )
			{
				return( i - _sign );
			}
		}
		
	}
	return 0;
}

function tiles_fill(_array , _x_speed , _player_width , _player_height )
{
	for(var _i = 0 ; _i < array_length(_array) ; _i++)
	{
		_array[_i] = tile_get_empty( tilemap_get_at_pixel( global.tilemap_hitbox_id , x + _x_speed + _player_width, y + (_player_height / 4 ) * _i ) );
	}
}

function check(_array , _value)
{
	for( var _i = 0; _i < array_length(_array) ; _i++ )
	{
		if( _array[_i] != _value){return false;}
	}
	return true;
}