// Inherit the parent event
event_inherited();

spd = 0;
chase_spd = .5;
dir = 0;
x_speed = 0;
y_speed = 0;

face = 1;

//state machine 
state = ENEMY_STATE.CHASING;
	//shooting state
	cooldown_time = 5*60;
	shoot_timer = irandom(cooldown_time);
	windup_time = 60;
	recover_time = 45;
	bullet_instance = noone;
	
	bullet_x_offset= 5;
	bullet_y_offset= -8;


