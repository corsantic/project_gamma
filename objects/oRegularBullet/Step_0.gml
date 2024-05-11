//move
	x_speed = lengthdir_x(spd, dir);
	y_speed = lengthdir_y(spd, dir);


	x+= x_speed;
	y+= y_speed;
	
	//collision
	if place_meeting(x, y, oSolidWall)
	{
		instance_destroy();
	}
	
	