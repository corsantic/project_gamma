//dynamically get width and height
draw_set_font(global.font_main);
var _new_width = 0;
for (var _i = 0; _i < op_length; _i++)
{
	var _op_w = string_width(options[menu_level, _i]);
	_new_width = max(_new_width, _op_w);
}
width = _new_width + op_border*2;
height = op_border *2 + string_height(options[MENU_LEVEL.MAIN][MAIN_MENU.START_GAME]) + (op_length -1)*op_space;

//center menu
var _cam = view_camera[0];
var _cam_x = camera_get_view_x(_cam);
var _cam_y = camera_get_view_y(_cam);
var _cam_width = camera_get_view_width(_cam);
var _cam_height = camera_get_view_height(_cam);

x = _cam_x + _cam_width/2 - width/2 ;
y = _cam_y + _cam_height/2 - height/2 ;

//draw a black rectangle over the screen
	draw_set_alpha(0.6);
	draw_rectangle_color(_cam_x, _cam_y, _cam_x + _cam_width, _cam_y + _cam_height, c_black, c_black, c_black, c_black, false);

//draw the menu background
draw_sprite_ext(sprite_index, image_index, x, y, width/sprite_width, height/sprite_height, 0, c_white, 1);

// draw the options
draw_set_valign(fa_top);
draw_set_halign(fa_left);

//draw_rectangle_color(x+op_border,y+op_space*1, x+op_border + string_width(options[menu_level, 0]), y + op_space+ string_height(options[menu_level, 0])*0,c_red,c_red,c_red,c_red,1)
for (var _i = 0; _i < op_length; _i++)
{
	var _c = c_white;
	var _is_mouse_hover_option = point_in_rectangle(mouse_x, mouse_y, x + op_border,y + op_border + op_space*_i, x + op_border + string_width(options[menu_level, _i]), y + op_border + op_space*_i + string_height(options[menu_level, _i]));
	
	if (_is_mouse_hover_option == true) {pos = _i};
	if (pos == _i ) { _c = c_yellow};

	//draw_rectangle_color(x + op_border,y + op_border + op_space*_i, x + op_border + string_width(options[menu_level, _i]), y + op_border + op_space*_i + string_height(options[menu_level, _i]),c_red,c_red,c_red,c_red,1)

	draw_text_color(x + op_border, y + op_border + op_space*_i, options[menu_level, _i], _c, _c, _c, _c, 1);
	
	
}

	draw_set_alpha(1);


