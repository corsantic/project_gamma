if (!instance_exists(oWarp) && place_meeting(x, y, oPlayer))
{
	var _instance =  instance_create_depth(0, 0, 0, oWarp);
	with(_instance)
	{
		target_object = other.target_object
		target_rm = other.target_rm;
	}
	
}