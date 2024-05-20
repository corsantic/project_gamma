//state machine
switch(state)
{
	//chase state
	case ENEMY_STATE.CHASING:
		//chase the player
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
				if(bbox_right > _cam_left && bbox_left < _cam_right && bbox_bottom > _cam_top && bbox_top < _cam_bottom)
				{	
					shoot_timer++;
				}
			
				if( shoot_timer > cooldown_time)
				{
					//set shoot state
					state = ENEMY_STATE.PAUSE_AND_SHOOT;
					//reset timer
					shoot_timer = 0;
			
				}
			
	
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
			
			//stop animating / manually set the image index
			image_index = 0;
			
			//shoot a bullet
				shoot_timer++;
				//create bullet
				if(shoot_timer == 1)
				{
					
					bullet_instance = instance_create_depth(x + bullet_x_offset * face, y + bullet_y_offset, depth, oEnemyBullet);
				}
				
				if (shoot_timer <= windup_time && instance_exists(bullet_instance))
				{
					bullet_instance.x = x + bullet_x_offset * face;
					bullet_instance.y = y + bullet_y_offset;
				}
				
				
				//shoot the bullet after the windup time is over
				if(shoot_timer == windup_time && instance_exists(bullet_instance))
				{
					//set out bullet's state to shooting state
					bullet_instance.state = BULLET_STATE.SHOOTING;
				}
				//recover and return to chasing player
				if (shoot_timer > windup_time + recover_time)
				{
					// go back to chasing player
					state = ENEMY_STATE.CHASING;
					//reset the timer so we can use it again					
					shoot_timer = 0;
				}
		#endregion
	break;
}


#region chase the player

	//getting the speeds
		x_speed = lengthdir_x(spd, dir);
		y_speed = lengthdir_y(spd, dir);
	
	//get the correct face
		if(dir > 90 && dir < 270)
		{ 
			face = -1;
		}
		else { face = 1;}
	//collisions
		if (place_meeting(x + x_speed, y, oWall) || place_meeting(x + x_speed, y, oEnemyParent))
		{
			x_speed = 0;
		}
		if (place_meeting(x, y + y_speed, oWall) || place_meeting(x, y + y_speed, oEnemyParent))
		{
			y_speed = 0;
		}
	
	//moving
		x += x_speed;
		y += y_speed
#endregion	

	//set the depth 
		depth = -y;


// Inherit the parent event
	//getting damaged and dying
	event_inherited();

	




