//damage setup
	get_damaged_create(20, true);
//player state
	state = PLAYER_STATE.MOVING;

//variables for movement
	move_direction = 0;
	move_speed = 2;
	x_speed = 0;
	y_speed = 0;

//sprite control
	//dash
		dash_speed = 12;
		dash_duration = 0.07 * game_get_speed(gamespeed_fps);
		is_dashing = false;
		dash_time = 0;
		dash_cooldown = 0.7 * game_get_speed(gamespeed_fps);
		current_cooldown = 0;
	//
	center_y_offset = -4;
	center_x_offset = 4;
	center_y = y + center_y_offset;
	center_x = x + center_x_offset;
	
	weapon_offset_distance = 4;
	aim_direction = 0;


	face = DIRECTION.DOWN;
	moving_direction = DIRECTION.DOWN;
	sprites = [sPlayerRightRun, sPlayerUpRun, sPlayerLeftRun, sPlayerDownRun];
	sprites_idle = [sPlayerRightIdle, sPlayerUpIdle, sPlayerLeftIdle, sPlayerDownIdle];
	sprites_dash = [sPlayerRightDash, sPlayerUpDash, sPlayerLeftDash, sPlayerDownDash];


//weapon info
	shoot_timer = 0;
	
	//add weapon to player weapon inv
	array_push(global.PlayerWeapons, global.WeaponList.pistol);

	
	selected_weapon = 0;
	weapon = global.PlayerWeapons[selected_weapon];
//reload
	reload_timer = 0;