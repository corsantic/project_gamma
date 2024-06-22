//get inputs

if (global.controller_mode)
{
	#region controller section
		var _game_pad = 0;
		if(gamepad_is_connected(_game_pad))
		{
			
			gamepad_set_axis_deadzone(_game_pad, .2);
			
			global.right_key = gamepad_button_check(_game_pad, gp_padr);
			global.left_key = gamepad_button_check(_game_pad, gp_padl);
			global.up_key = gamepad_button_check(_game_pad, gp_padu);
			global.down_key = gamepad_button_check(_game_pad, gp_padd);
			global.dash_key_pressed = gamepad_button_check_pressed(_game_pad, gp_shoulderl);
			global.reload_key_pressed = gamepad_button_check_pressed(_game_pad, gp_shoulderr);

			global.xasis_left = gamepad_axis_value(_game_pad, gp_axislh) + (global.right_key - global.left_key);
			global.yasis_left = gamepad_axis_value(_game_pad, gp_axislv) + (global.down_key - global.up_key);
			
			global.xasis_left = clamp(global.xasis_left, -1, 1);
			global.yasis_left = clamp(global.yasis_left, -1, 1);
			
			
			global.xasis_right = gamepad_axis_value(_game_pad, gp_axisrh);
			global.yasis_right = gamepad_axis_value(_game_pad, gp_axisrv);
			
			
			
			global.shoot_key =  gamepad_button_check(_game_pad, gp_shoulderrb);
			global.swap_key_pressed = gamepad_button_check_pressed(_game_pad, gp_shoulderlb);


			global.start_key_pressed = gamepad_button_check_pressed(_game_pad, gp_start);

		
		}

	#endregion
}
else
{
	#region kbm section
		global.right_key = keyboard_check(ord("D"));
		global.left_key = keyboard_check(ord("A"));
		global.up_key = keyboard_check(ord("W"));
		global.down_key = keyboard_check(ord("S"));
		global.dash_key_pressed = keyboard_check_pressed(vk_space);
		global.reload_key_pressed = keyboard_check_pressed(ord("R"));
		
		
		global.xasis_left = global.right_key - global.left_key;
		global.yasis_left = global.down_key - global.up_key;

		global.shoot_key = mouse_check_button(mb_left);
		global.swap_key_pressed = mouse_check_button_pressed(mb_right);
		global.swap_up_key = mouse_wheel_up();
		global.swap_down_key = mouse_wheel_down();

		global.start_key_pressed = keyboard_check_pressed(vk_escape);
		
	#endregion
}






