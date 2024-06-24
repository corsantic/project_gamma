//@description aiming
function player_aiming(){
	center_y = y + center_y_offset;
	center_x = x + center_x_offset;
	//direction check: is controller or kbm
	if(global.controller_mode)
	{
		if(global.xasis_right != 0 || (global.yasis_right != 0))
		{
			aim_direction = point_direction(0, 0, global.xasis_right, global.yasis_right);
		}
	}
	else
	{
		aim_direction = point_direction(center_x, center_y, mouse_x, mouse_y);
	}

}