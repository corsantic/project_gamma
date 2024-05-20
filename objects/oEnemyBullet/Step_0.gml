//state machine

switch(state){
	//wait for enemy to shoot state
	case BULLET_STATE.NOT_MOVING:
		if(instance_exists(oPlayer))
		{
			dir = point_direction(x, y, oPlayer.x, oPlayer.y);
		}
		
		// set depth to make myself more visible
		depth = -y - 50;
	break;
	
	//shoot / travel
	case BULLET_STATE.SHOOTING:
		//movement 
		x_spd = lengthdir_x(spd, dir);
		y_spd = lengthdir_y(spd, dir);
		
		
		x += x_spd;
		y += y_spd;
		
		//updated depth
		depth = -y;
		
	break;
	
	
}

// spin bullets with image angle
	if (is_spinning)
	{	
		image_angle = image_angle + 90 / 4; 
	}
	
	
#region cleanup
	//out of room bounds
	if(bbox_right < 0 || bbox_left > room_width || bbox_bottom < 0 || bbox_top > room_height)
	{
		destroy = true;
	}


	//player collision
	if(hit_confirm && player_destroy) { destroy = true; }

	//destroy
	if (destroy) { instance_destroy(); }
	
	//wall collision
	if(place_meeting(x,y, oSolidWall)) { destroy = true;}
	
#endregion
