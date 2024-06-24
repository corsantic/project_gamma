//@description player movement
function player_movement(){
	var _dash_key_pressed = global.dash_key_pressed;
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
	collision_check();
	
	//dash
	dash_check(_dash_key_pressed);


	if(is_dashing)
	{
		dash_movement();
	}
	else
	{
		move_player();
	}
	
}


function move_player()
{
		// move the player
		x += x_speed;
		y += y_speed;
}

function dash_check(_dash_key_pressed)
{
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
}

function dash_movement()
{
	var _dash_vector_x = lengthdir_x(dash_speed, move_direction);
	var _dash_vector_y = lengthdir_y(dash_speed, move_direction);
	//collision check for dashing
	if (!place_meeting(x + _dash_vector_x, y, oWall) &&  !place_meeting(x, y + _dash_vector_y, oWall))
	{
		x += _dash_vector_x;
		y += _dash_vector_y;
	}

}

function collision_check()
{
	if place_meeting(x + x_speed, y, oWall)
	{
		x_speed = 0;
	}
	
	if place_meeting(x, y + y_speed, oWall)
	{
		y_speed = 0;
	}
}