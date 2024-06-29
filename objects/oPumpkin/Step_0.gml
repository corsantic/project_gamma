var _is_screen_paused = screen_pause();
if(_is_screen_paused) exit;


//code commands
var _wall_collisions = true;
var _enemy_collisions = true;
var _get_damage = true;
var _auto_sprites = true;

//state machine
switch(state)
{
	case ENEMY_STATE.SPAWN:
		#region spawn state 
			//fade in
			if(image_alpha < 1)
			{
				//don't walk while fading in
				spd = 0;
				image_alpha += fade_speed;
			}
		
			//walk out
			_wall_collisions = false;
			_get_damage = false;
			if (image_alpha >= 1)
			{
				//set the right speed
				spd = emerge_speed;
				dir = 270; //straight down
			}
		
			//switch to the chasing state
			if(!place_meeting(x, y ,oWall))
			{
				state = ENEMY_STATE.CHASING;
			}
	#endregion
	break;
	
	
	//chase state
	case ENEMY_STATE.CHASING:
		#region chase the player
			//direction
			if(instance_exists(oPlayer))
			{
				dir = point_direction(x, y, oPlayer.x, oPlayer.y);
			}
			
			//set the correct speed 
			spd = chase_spd;
			
			//transition to shooting state;
				var _cam = view_camera[0];
				var _cam_left = camera_get_view_x(_cam);
				var _cam_right = _cam_left + camera_get_view_width(_cam);
				var _cam_top = camera_get_view_y(_cam);
				var _cam_bottom = _cam_top + camera_get_view_height(_cam);
			
				// only add to timer if onscreen
				if(	bbox_right > _cam_left 
					&& bbox_left < _cam_right 
					&& bbox_bottom > _cam_top 
					&& bbox_top < _cam_bottom)
				{	
					shoot_timer++;
				}
			
				if(shoot_timer > cooldown_time)
				{
					//set shoot state
					state = ENEMY_STATE.PAUSE_AND_SHOOT;
					//reset timer
					shoot_timer = 0;
				}
			
	#endregion
	break;
	
	case ENEMY_STATE.PAUSE_AND_SHOOT:
		#region pause and shot
		//pause enemy
			//direction
			if(instance_exists(oPlayer))
			{
				dir = point_direction(x, y, oPlayer.x, oPlayer.y);
			}
			
			//set the correct speed
            spd = 0;
			var _is_attack_sprite = sprite_index == sPumpkinAttack ;
			var _floor_image_index = floor(image_index);
			_auto_sprites = false;
			//start the attack animation
			if (!_is_attack_sprite)
			{
				sprite_index = sPumpkinAttack;
				image_index = 0;
			}
			
			//create attack object
			if(	_is_attack_sprite
				&& _floor_image_index == attack_frame 
				&& !attack_triggered)
			{
				attack_triggered = true;
				
				var _attack_distance = 200;
				var _attack_seperation = 20;
				var _attack_number  = round(_attack_distance / _attack_seperation);
				var _attack_dir_seperation = 15;
				
				for (var _ds = 0; _ds < 3; _ds++)
				{
					var _dir  = dir - _attack_dir_seperation + _attack_dir_seperation * _ds;	
					for (var _i = 0; _i < _attack_number; _i++)
					{
				
						var _xx = x + lengthdir_x(_attack_seperation*_i, _dir);
						var _yy = y + lengthdir_y(_attack_seperation*_i, _dir);
					
						if(!position_meeting(_xx, _yy, oWall))
						{
							var _vine_instance = instance_create_depth(_xx, _yy, depth, oPumpkinVine);
							with(_vine_instance)
							{
								delay = _i*3;
							}
						}
						else
						{
							break;
						}
					}
				
				}
			
			}
			//hold the animation
			if (_is_attack_sprite && _floor_image_index == hold_frame)
			{
				hold_timer--;
				if(hold_timer > 0)
				{
					image_index = hold_frame;
				}
			}

			
		#endregion
	break;
	
	
	case ENEMY_STATE.DEATH:
		#region death of the enemy play animation
			
			//set the correct speed
            spd = 0;
			
			global.enemy_kill_count++;		
				
			instance_destroy();
				
			if(	global.enemy_kill_count mod 30 == 0 
				|| global.enemy_kill_count == global.enemy_room_max)
			{
				//create item
				instance_create_depth(x, y, depth, oHeart);
			}
			if(global.enemy_kill_count mod 15 == 0)
			{
				//create weapon
				var _instance = instance_create_depth(x, y, depth, oWeaponPickup);
				with(_instance)
				{
					image_index = irandom_range(1, image_number - 1);
				}
			}
			//boom vfx
			create_animated_vfx(sSmallBoom, x, y, depth);
			
		#endregion
	break;

	
	
}

//reset the attack variable
if(sprite_index != sPumpkinAttack) 
{
	attack_triggered = false;
	hold_timer = hold_time;
}


#region chase the player

	//getting the speeds
		x_speed = lengthdir_x(spd, dir);
		y_speed = lengthdir_y(spd, dir);
	
	//get the correct sprite
	if(_auto_sprites)
	{
		face = round(dir / degree); 
		if face == DIRECTION.OUT { face = DIRECTION.RIGHT; };
		sprite_index = sprites[face];
		mask_index = sprites[3];
	}
	//collisions
	
		//wall collision
		if(_wall_collisions)
		{
			if (place_meeting(x + x_speed, y, oWall))
			{
				x_speed = 0;
			}
			if (place_meeting(x, y + y_speed, oWall))
			{
				y_speed = 0;
			}
		}
		//enemy collisions
		if(_enemy_collisions)
		{
			
			if (place_meeting(x + x_speed, y, oEnemyParent))
			{
				x_speed = 0;
			}
			if (place_meeting(x, y + y_speed, oEnemyParent))
			{
				y_speed = 0;
			}
		}
		
	//moving
		x += x_speed;
		y += y_speed
#endregion	

	//set the depth 
		depth = -y;


// Inherit the parent event
if(_get_damage == true)
{
	//getting damaged and dying
	event_inherited();
}

	




