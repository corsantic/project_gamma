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
	
	break;
	
	case ENEMY_STATE.PAUSE:
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

	




