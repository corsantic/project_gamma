#region chase the player
	//direction
		if(instance_exists(oPlayer))
		{
			dir = point_direction(x, y, oPlayer.x, oPlayer.y);
		}
	
	//getting the speeds
		x_speed = lengthdir_x(spd, dir);
		y_speed = lengthdir_y(spd, dir);
	
	//get the correct face
		if(x_speed > 0){ face = 1;}
		if(x_speed < 0){ face = -1;}

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


// Inherit the parent event
	//getting damaged and dying
	event_inherited();

	




