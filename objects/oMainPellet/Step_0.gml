//pause self
var _is_screen_paused = screen_pause();
if(_is_screen_paused) exit;


//move
	x_speed = lengthdir_x(spd, dir);
	y_speed = lengthdir_y(spd, dir);

	x += x_speed;
	y += y_speed;
	
//depth
	depth = -y;
	
//cleanup
	//hit confirm destroy
	if (hit_confirm && enemy_destroy) { destroy = true; }

	//destroy
	if(destroy == true) { instance_destroy(); }
	
	//collision
	if(place_meeting(x, y, oSolidWall)) { destroy = true; }
	
	
	//bullet out of range
	if(point_distance(xstart, ystart, x, y) > max_dist) { destroy = true; }

	