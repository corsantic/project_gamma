//get the shoot input
var _shoot_key = global.shoot_key;

//fade in
alpha += alpha_speed;
alpha = clamp(alpha, 0, 1);

//restart
if(_shoot_key && alpha >= 1)
{
	room_restart();
}