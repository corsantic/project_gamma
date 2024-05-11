/// @function							draw_player_weapon(_weapon)
/// @param {Asset.GMSprite}	_weapon		The sprite of the weapon

function draw_player_weapon(_weapon)
{
	//get the weapon of the player's body
	var _x_offset = lengthdir_x(weapon_offset_distance, aim_direction);
	var _y_offset = lengthdir_y(weapon_offset_distance, aim_direction);
	
	// flip the weapon upright
	var _weapon_y_scale = 1;
	
	if(aim_direction > 90 && aim_direction < 270)
	{
		_weapon_y_scale = -1;
	}


	draw_sprite_ext(_weapon, 0, center_x + _x_offset, center_y +_y_offset, 1, _weapon_y_scale, aim_direction, c_white, 1);

}