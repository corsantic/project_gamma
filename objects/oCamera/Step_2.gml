//get the camera's width and height
	var _camera_id = view_camera[0]

	var _cam_width = camera_get_view_width(_camera_id);
	var _cam_height = camera_get_view_height(_camera_id);
	
//center on the player
	if (instance_exists(oPlayer))
	{
		x = oPlayer.x - _cam_width/2;
		y = oPlayer.center_y - _cam_height/2;
	
	}
#region camera shaking
	//x shake
	if (x_shake_amount > 0)
	{
		x_shake_dir += x_shake_dir_speed;
		x_shake_amount -= x_shake_amount_speed;
	}
	else
	{
		x_shake_amount = 0;
		x_shake_dir = 0;
	}
	
	x_shake = dsin(x_shake_dir) * x_shake_amount;
	
	//y shake
	if (y_shake_amount > 0)
	{
		y_shake_dir += y_shake_dir_speed;
		y_shake_amount -= y_shake_amount_speed;
	}
	else
	{
		y_shake_amount = 0;
		y_shake_dir = 0;
	}
	
	y_shake = dsin(y_shake_dir) * y_shake_amount;
	
//add in the camera shake
x += x_shake;
y += y_shake;


#endregion	

	
//clamp cam position to room borders
	x = clamp(x, 0, room_width - _cam_width);
	y = clamp(y, 0, room_height - _cam_height);
	
	
	
//set the camera position
	camera_set_view_pos(_camera_id, x, y);

