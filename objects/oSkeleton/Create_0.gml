// Inherit the parent event
event_inherited();

spd = .5;
chase_spd = .5;
dir = 0;
x_speed = 0;
y_speed = 0;

face = 1;

//state machine 
state = ENEMY_STATE.CHASING;
	//shooting state
	cooldown_time = 4*60;
	shoot_timer = 0;
	windup_time = 60;
	recover_time = 45;
	bullet_instance = noone;


