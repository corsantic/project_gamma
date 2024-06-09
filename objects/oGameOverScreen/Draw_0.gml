var _cam = view_camera[0];
var _cam_x = camera_get_view_x(_cam);
var _cam_y = camera_get_view_y(_cam);
var _cam_width = camera_get_view_width(_cam);
var _cam_height = camera_get_view_height(_cam);

//draw a black rectangle over the screen
	draw_set_alpha(alpha * alpha_max);
	draw_rectangle_color(_cam_x, _cam_y, _cam_x + _cam_width, _cam_y + _cam_height, c_black, c_black, c_black, c_black, false);


//draw the text
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_alpha(alpha);
	//"game over"	
		var _gameover_y_offset = -32;
		draw_text_transformed(_cam_x + _cam_width/2, _cam_y + _cam_height/2 + _gameover_y_offset, "YOU DIED", 7, 7, 0);
	//"press shoot to restart"
		var _restart_y_offset = 80;
		draw_text_transformed(_cam_x + _cam_width/2, _cam_y + _cam_height/2+ _restart_y_offset, "- Press Shoot to Restart -",2, 2, 0);
		
	
//reset the alpha
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_alpha(1);
	