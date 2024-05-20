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
			shoot_timer++;
			
			if( shoot_timer > cooldown_time)
			{
				//set shoot state
				state = ENEMY_STATE.PAUSE_AND_SHOOT;
				//reset timer
				shoot_timer = 0;
			
			}
			
	
	break;
	
	case ENEMY_STATE.PAUSE_AND_SHOOT:
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
					
					bullet_instance = instance_create_depth(x, y, depth, oEnemyBullet);

				}
				
				//shoot the bullet after the windup time is over
				if(shoot_timer == windup_time && instance_exists(bullet_instance))
				{
					//set out bullet's state to shooting state
					bullet_instance.state = BULLET_STATE.SHOOTING;
				}
				
				if (shoot_timer > windup_time + recover_time)
				{
					// go back to chasing player
					state = ENEMY_STATE.CHASING;
					//reset the timer so we can use it again					
					shoot_timer = 0;
				}
		
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

	




