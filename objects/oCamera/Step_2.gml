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
	
//clamp cam position to room borders
	x = clamp(x, 0, room_width - _cam_width);
	y = clamp(y, 0, room_height - _cam_height);
	
	
	
//set the camera position
	camera_set_view_pos(_camera_id, x, y);

