alpha= .6;
depth = -8500;

width = 80;
height = 104;

op_border = 8;
op_space  = 16;

pos = 0;
mx_prev = mouse_x;
my_prev = mouse_y;
//main menu
options[MENU_LEVEL.MAIN, MAIN_MENU.START_GAME] = "Resume Game";
options[MENU_LEVEL.MAIN, MAIN_MENU.SETTINGS] = "Settings";
options[MENU_LEVEL.MAIN, MAIN_MENU.QUIT] = "Quit Game";


//settings menu
options[MENU_LEVEL.SETTINGS, SETTINGS_MENU.WINDOW_SIZE] = "Window Size";
options[MENU_LEVEL.SETTINGS, SETTINGS_MENU.BRIGHTNESS] = "Brightness";
options[MENU_LEVEL.SETTINGS, SETTINGS_MENU.CONTROL] = "Controls";
options[MENU_LEVEL.SETTINGS, SETTINGS_MENU.BACK] = "Back";


op_length = 0;
menu_level = 0;


