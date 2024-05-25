//get inputs
var _right_key = global.right_key;
var _left_key =	global.left_key;
var _up_key = global.up_key;
var _down_key = global.down_key;
var _space_key_pressed = global.space_key_pressed;
var _shoot_key = global.shoot_key;
var _swap_key_pressed = global.swap_key_pressed;



#region player movement
	// get the direction
	var _horizontal_key = _right_key - _left_key;
	var _vertical_key = _down_key - _up_key;//in game maker y is reverted
	move_direction = point_direction(0, 0, _horizontal_key, _vertical_key)
	
	// get the x and y speeds
	var _speed = 0;
	var _input_level = point_distance(0, 0, _horizontal_key, _vertical_key); 
	_input_level = clamp(_input_level, 0, 1);
	_speed = move_speed * _input_level;
	
	x_speed = lengthdir_x(_speed, move_direction);
	y_speed = lengthdir_y(_speed, move_direction);
	
	//collisions
	if place_meeting(x + x_speed, y, oWall)
	{
		x_speed = 0;
	}
	
	if place_meeting(x, y + y_speed, oWall)
	{
		y_speed = 0;
	}
	
	//dash
	if(_space_key_pressed && !is_dashing && current_cooldown <= 0)
	{
		is_dashing = true;
		dash_time = dash_duration;
		current_cooldown = dash_cooldown;
	}
	
	// Update dash status
	if (is_dashing) {
	    dash_time -= 1;
	    if (dash_time <= 0) {
	        is_dashing = false;
	    }
	}
	if (current_cooldown > 0) {
		current_cooldown -= 1;
	}


	if(is_dashing){
	    var _dash_vector_x = lengthdir_x(dash_speed, move_direction);
	    var _dash_vector_y = lengthdir_y(dash_speed, move_direction);
		//collision check for dashing
		if (!place_meeting(x + _dash_vector_x, y, oWall) &&  !place_meeting(x, y + _dash_vector_y, oWall))
		{
		    x += _dash_vector_x;
		    y += _dash_vector_y;

		}

	}
	else{
		// move the player
		x += x_speed;
		y += y_speed;
	}
	

	
	//depth
	depth = -bbox_bottom;
	
	
#endregion
#region get damaged
	get_damaged(oDamagePlayer, true);
#endregion


#region player aiming
	center_y = y + center_y_offset;
	center_x = x + center_x_offset;
	
	aim_direction = point_direction(center_x, center_y, mouse_x, mouse_y);
#endregion
#region sprite control
	//make sure the player is facing the correct direction
	var _degree = 90;
	face = round(aim_direction / _degree); 
	
	if face == 4 { face = 0; };
	
	mask_index = sprites[3];
	//set the player sprite
	if(x_speed == 0 && y_speed == 0)
	{
		//animate 
		//image_index = 0;
	
		sprite_index = sprites_idle[face];
	}
	else
	{
		sprite_index = sprites[face];
	}
#endregion
#region weapon swapping
	var _playerWeapons = global.PlayerWeapons;
	
	//cycle through weapons
	if(_swap_key_pressed){
	
		//change the selection and wrap around
		selected_weapon++;
		
		if(selected_weapon >= array_length(_playerWeapons)) { selected_weapon = 0;}
		
		weapon = _playerWeapons[selected_weapon];
	}
	

#endregion
#region shoot the weapon
if(shoot_timer > 0) { shoot_timer--; }

if(_shoot_key && shoot_timer <= 0)
{
	//reset the timer
	shoot_timer = weapon.cooldown;
	//shooting
		//create the bullet
		var _x_offset = lengthdir_x(weapon.length + weapon_offset_distance, aim_direction);
		var _y_offset = lengthdir_y(weapon.length + weapon_offset_distance, aim_direction);
		
		var _spread = weapon.spread;
		var _spread_div = _spread / max(weapon.bullet_num - 1, 1);
		
		//create the correct number of bullets
		for(var _i = 0; _i < weapon.bullet_num; _i++)
		{
			
			var _bullet_instance = instance_create_depth(center_x + _x_offset, center_y + _y_offset, depth - 100, weapon.bullet);
	
			//change the bullet's direction
			with(_bullet_instance)
			{
				dir = other.aim_direction - _spread/2 + _spread_div*_i;		
				
				// turn the bullet to correct direction at creation if necessary
				if(dir_fix == true){ image_angle = dir; }
			}
			
		}
		
}
#endregion

#region death / gameover
	if(hp <= 0)
	{	
		//create the game over
		instance_create_depth(0, 0, -10000,oGameOverScreen);
		
		//destroy ourself
		instance_destroy();
	}
#endregion