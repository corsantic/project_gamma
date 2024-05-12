//variables for movement
	move_direction = 0;
	move_speed = 2;
	x_speed = 0;
	y_speed = 0;

//sprite control
	center_y_offset = -4;
	center_x_offset = 4;
	
	weapon_offset_distance = 4;
	aim_direction = 0;


	face = 3;
	sprites = [sPlayerRightRun, sPlayerUpRun, sPlayerLeftRun, sPlayerDownRun];
	sprites_idle = [sPlayerRightIdle, sPlayerUpIdle, sPlayerLeftIdle, sPlayerDownIdle];


//weapon info
	shoot_timer = 0;


	weapon = global.WeaponList.pistol;
	
	
	
	