// chase the player
	//direction
	dir = point_direction(x, y,oPlayer.x, oPlayer.y);
	//getting the speeds
	x_speed = lengthdir_x(spd, dir);
	y_speed = lengthdir_y(spd, dir);
	
	//moving
	x+=	x_speed;
	y+= y_speed
	


// Inherit the parent event
	//getting damaged and dying
	event_inherited();




