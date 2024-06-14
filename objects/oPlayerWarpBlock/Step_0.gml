if (place_meeting(x, y, oPlayer) && !instance_exists(oWarp))
{
	var _instance =  instance_create_depth(0, 0, -9999, oWarp);
	
	_instance.target_x = target_x;
	_instance.target_y = target_y;
	_instance.target_rm = target_rm;
}