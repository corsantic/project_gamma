// Inherit the parent event
event_inherited();

//sprite control
sprites = [sPumpkinRight, sPumpkinUp, sPumpkinLeft, sPumpkinDown];
degree = 90;
face = DIRECTION.DOWN;
attack_frame = 11;
hold_frame = 12;
attack_triggered = false;
hold_time = game_get_speed(gamespeed_fps) * 1;
hold_timer = hold_time;

spd = 0;
chase_spd = .25;
dir = 0;
x_speed = 0;
y_speed = 0;
hp = 10;
max_hp = 10;




	//shooting state
	cooldown_time = 5 * 60;
	shoot_timer = irandom(cooldown_time);
	windup_time = 60;
	recover_time = 45;
	bullet_instance = noone;
	
	bullet_x_offset= 5;
	bullet_y_offset= -8;
	//spawn state
	fade_speed = 1/15;
	emerge_speed = .45;
	
	
	
	

