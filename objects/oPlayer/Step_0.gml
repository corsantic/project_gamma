//get inputs
var _right_key = global.right_key;
var _left_key =	global.left_key;
var _up_key = global.up_key;
var _down_key = global.down_key;
var _dash_key_pressed = global.dash_key_pressed;
var _shoot_key = global.shoot_key;
var _swap_down_key_pressed = global.swap_down_key;
var _swap_up_key_pressed = global.swap_up_key;
var _start_key_pressed = global.start_key_pressed;
var _reload_key_pressed = global.reload_key_pressed;

var _degree = 90;

if(instance_exists(oWarp))
{
	image_index = 0;
	sprite_index = sprites_idle[face];
	aim_direction = face * _degree;
	center_y = y + center_y_offset;
	
}

#region pause game
//pause menu
if(_start_key_pressed)
{
		if(!instance_exists(oPauseMenu))
		{
			instance_create_depth(0, 0, 0, oPauseMenu);
		}
		else{
			instance_destroy(oPauseMenu);
		}
}




//pause self
var _is_screen_paused = screen_pause();
if(_is_screen_paused) exit;

#endregion

#region player movement
	// get the direction
	var _horizontal_key = global.xasis_left;
	var _vertical_key = global.yasis_left;
	move_direction = point_direction(0, 0, _horizontal_key, _vertical_key)
	
	// get the x and y speeds
	var _speed = 0;
	var _input_level = point_distance(0, 0, _horizontal_key, _vertical_key); 
	_input_level = clamp(_input_level, 0, 1);
	_speed = move_speed * _input_level;
	if(state == PLAYER_STATE.PAUSE){
		x_speed = 0;
		y_speed = 0;
	}
	else
	{
		x_speed = lengthdir_x(_speed, move_direction);
		y_speed = lengthdir_y(_speed, move_direction);
	}
	

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
	if(_dash_key_pressed && !is_dashing && current_cooldown <= 0)
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
	if (get_damaged(oDamagePlayer, true))
	{
		//sound
		ds_list_add(oSFX.sfx_list, new CreateSFX(sfxGetDamaged, 1, 4));
		
		//hit screen
		instance_create_depth(0, 0, 0, oHitScreen);
		
		//screen shake
		camera_shake(6);
		
		//screen pause
		create_screen_pause_timed(25);
	}
#endregion
#region player aiming
	center_y = y + center_y_offset;
	center_x = x + center_x_offset;
	//direction check: is controller or kbm
	if(global.controller_mode)
	{
		if(global.xasis_right != 0 || (global.yasis_right != 0))
		{
			aim_direction = point_direction(0, 0, global.xasis_right, global.yasis_right);
		}
	}
	else
	{
		aim_direction = point_direction(center_x, center_y, mouse_x, mouse_y);
	}
	
	
	
#endregion
#region sprite control
	//make sure the player is facing the correct direction

	face = round(aim_direction / _degree); 
	
	if face == DIRECTION.OUT { face = DIRECTION.RIGHT; };

	//dash sprite change
	if(is_dashing)
	{
		/*	Move direction of the player. 
		*	Because we want to change player's sprite when dashing
		*/
		moving_direction = round(move_direction/ _degree);
		if moving_direction ==  DIRECTION.OUT { moving_direction = DIRECTION.RIGHT; };
		sprite_index = sprites_dash[moving_direction];
	}
	else{
		//set the player sprite
		mask_index = sprites[DIRECTION.DOWN];
		
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
	
	}


#endregion
#region weapon swapping
	var _playerWeapons = global.PlayerWeapons;
	var _weapon_selected_key = global.weapon_selected_key;
	
	//cycle through weapons
	if(_swap_down_key_pressed || _swap_up_key_pressed || _weapon_selected_key != 0)
	{
		//change the selection and wrap around
		if(_swap_up_key_pressed) selected_weapon++;
		if(_swap_down_key_pressed) selected_weapon--;
	
		if(_weapon_selected_key != 0)
		{	
			// -1 because its start from 1
			selected_weapon = _weapon_selected_key - 1;
			// set back to zero after weapon selected 
			global.weapon_selected_key = 0;
		}
		else
		{
			if(selected_weapon < 0)
			{	
				selected_weapon = array_length(_playerWeapons) - 1;
			}
			if(selected_weapon >= array_length(_playerWeapons)) 
			{ 
				selected_weapon = 0;
			}
		}
		reload_cancel = true;
	}
	
	//set the new weapon
	weapon = _playerWeapons[selected_weapon];
	

#endregion
#region reload
if (reload_cancel) {
    alarm[0] = -1; // Cancel the reload alarm
    is_reloading = false;
    stop_sfx(sfxReload);
    reload_cancel = false;
} else {
    if ((_reload_key_pressed || weapon.ammo.is_magazine_empty()) 
		&& weapon.ammo.spare_count > 0 
		&& alarm[0] == -1 
		&& !is_reloading) {
        alarm[0] = weapon.ammo.reload_time; // Set the alarm to the reload time
        play_sfx(sfxReload, true);
        is_reloading = true;
    }
}

#endregion
#region shoot the weapon
if(shoot_timer > 0) { shoot_timer--; }
var _is_shoot_ready_and_pressed = _shoot_key && shoot_timer <= 0;


if(_is_shoot_ready_and_pressed && !is_reloading && !weapon.ammo.is_magazine_empty())
{
	//reset the timer
	shoot_timer = weapon.cooldown;
	//shoot and substract ammo
	weapon.ammo.shoot();

	//camera shake
	camera_shake(weapon.shake);
	
	//shooting
		//create the bullet
		var _weapon_net_length = weapon.length + weapon_offset_distance;
		var _x_offset = lengthdir_x(_weapon_net_length, aim_direction);
		var _y_offset = lengthdir_y(_weapon_net_length, aim_direction);
		
		var _spread = weapon.spread;
		var _spread_div = _spread / max(weapon.bullet_num - 1, 1);
		
		var _weapon_tip_x = center_x + _x_offset;
		var _weapon_tip_y = center_y + _y_offset;
		
		//play sound effect
		ds_list_add(oSFX.sfx_list, new CreateSFX(weapon.sound_effect));
		
		//create weapon flash
		create_animated_vfx(weapon.flash_sprite,
							_weapon_tip_x,
							_weapon_tip_y,
							depth - 10,
							aim_direction);
		
		
		//create the correct number of bullets
		for(var _i = 0; _i < weapon.bullet_num; _i++)
		{
			
			var _bullet_instance = instance_create_depth(_weapon_tip_x, _weapon_tip_y,
														depth, weapon.bullet);
	
			//change the bullet's direction
			with(_bullet_instance)
			{
				dir = other.aim_direction - _spread/2 + _spread_div*_i;		
				
				// turn the bullet to correct direction at creation if necessary
				if(dir_fix == true){ image_angle = dir; }
			}
			
		}
}
else if (_is_shoot_ready_and_pressed && weapon.ammo.is_magazine_empty() && !is_reloading)
{
	//play empty magazine
	alarm[1] = 2;
}




#endregion
#region death / gameover
	if(hp <= 0)
	{	
		//create the game over
		instance_create_depth(0, 0, -10000,oGameOverScreen);
		
		//boom vfx
		create_animated_vfx(sSmallBoom, x, y, depth);
		
		
		
		//destroy ourself
		instance_destroy();
	}
#endregion