//damage setup
	get_damaged_create(20, true);


//variables for movement
	move_direction = 0;
	move_speed = 2;
	x_speed = 0;
	y_speed = 0;

//sprite control
	center_y_offset = -4;
	center_x_offset = 4;
	center_y = y + center_y_offset;
	center_x = x + center_x_offset;
	
	weapon_offset_distance = 4;
	aim_direction = 0;


	face = 3;
	sprites = [sPlayerRightRun, sPlayerUpRun, sPlayerLeftRun, sPlayerDownRun];
	sprites_idle = [sPlayerRightIdle, sPlayerUpIdle, sPlayerLeftIdle, sPlayerDownIdle];


//weapon info
	shoot_timer = 0;
	
	//add weapon to player weapon inv
	array_push(global.PlayerWeapons, global.WeaponList.pistol, global.WeaponList.shotgun, global.WeaponList.ak47);

	
	selected_weapon = 0;
	weapon = global.PlayerWeapons[selected_weapon];