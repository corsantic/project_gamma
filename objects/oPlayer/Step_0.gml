//get inputs
var _right_key = keyboard_check(ord("D"));
var _left_key = keyboard_check(ord("A"));
var _up_key = keyboard_check(ord("W"));
var _down_key = keyboard_check(ord("S"));
var _shoot_key = mouse_check_button(mb_left);


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
	
	// move the player
	x += x_speed;
	y += y_speed;
	
	
	//depth
	depth = -bbox_bottom;
	
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
		image_index = 0;
	
		sprite_index = sprites_idle[face];
	}
	else
	{
		sprite_index = sprites[face];
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
		var _bullet_instance = instance_create_depth(center_x + _x_offset, center_y + _y_offset, depth - 100, weapon.bullet);
	
		//change the bullet's direction
		with(_bullet_instance)
		{
			dir = other.aim_direction;		
		}		
}
#endregion
