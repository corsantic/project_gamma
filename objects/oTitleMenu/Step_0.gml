//get inputs
var _up_key = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
var _down_key = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
var _accept_key = keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter);
var _mouse_click = mouse_check_button_pressed(mb_left);

//store number of options in current menu
op_length = array_length(options[menu_level]);


//move through the menu
pos += _down_key - _up_key;

if (pos >= op_length) {
    pos = 0;
}
if (pos < 0) {
    pos = op_length - 1;
}


//using the options
if (_accept_key || _mouse_click) {
	var _start_menu_level = menu_level;
	
	
    switch (menu_level) {
        case MENU_LEVEL.MAIN:
            switch (pos) {
                //start game
                case MAIN_MENU.START_GAME:
					//todo: saved room ?
					room_goto_next();
                    //room_goto(Level_2);
                    break;

                    //settings
                case MAIN_MENU.SETTINGS:
                    menu_level = 1;
                    break;

                    //quit game
                case MAIN_MENU.QUIT:
                    game_end();
                    break;
            }
            break;

            //settings
        case MAIN_MENU.SETTINGS:
            switch (pos) {

                case SETTINGS_MENU.WINDOW_SIZE:
                    //todo
                    break;
                case SETTINGS_MENU.BRIGHTNESS:
                    //todo
                    break;
                case SETTINGS_MENU.CONTROL:
                    //todo
                    break;
                case SETTINGS_MENU.BACK:
                    menu_level = 0;
                    break;

            }

            break;
	
    }
	
	//set position back
	if (_start_menu_level != menu_level)
	{
		pos = 0;
	}
	
	//correct options length
	op_length = array_length(options[menu_level]);

}