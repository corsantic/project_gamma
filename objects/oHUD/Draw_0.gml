var _cam = view_camera[0];

//get the cam coordinates
var _cam_x= camera_get_view_x(_cam);
var _cam_y= camera_get_view_y(_cam);

//draw the player's hp

if (instance_exists(oPlayer))
{
	#region draw player hp
	
		var _padding = 8;
		var _seperation = 3;
		var _health_bar_x_pos= _cam_x + _padding;
		var _health_bar_y_pos= _cam_y + _padding;
	
		draw_sprite(sPlayerHpBar, 0, _health_bar_x_pos, _health_bar_y_pos);
	
		for (var _i = 0; _i < player_max_hp; _i++)
		{
			//show current hp
			var _image_of_bar = 1;
			if ( _i+1 <= player_hp ) { _image_of_bar = 2; }
		
			draw_sprite(sPlayerHpBar, _image_of_bar, _health_bar_x_pos + _seperation*_i, _health_bar_y_pos)
		}
	
	#endregion

}
