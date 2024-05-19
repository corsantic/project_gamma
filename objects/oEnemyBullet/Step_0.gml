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
		state=  1;
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