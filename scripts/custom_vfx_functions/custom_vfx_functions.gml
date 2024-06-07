//@description custom VFX functions

function screen_pause()
{
	//pause self
	if (instance_exists(oScreenPause))
	{
		image_speed = 0;
		return true;
	}
	else {
		image_speed = 1;
	}
	
	return false;
}

function create_screen_pause_timed(_time = 3){

	var _screen_pause_timer = instance_create_depth(0, 0, 0, oScreenPauseTimed);
	with(_screen_pause_timer)
	{
		timer =  _time;
	}
}

function camera_shake(_amount = 4)
{
	_amount *= global.screen_shake_amount;
	with(oCamera)
	{
		x_shake_amount = _amount;
		y_shake_amount = _amount;
	}
}

function create_animated_vfx(_sprite, _x, _y, _depth = -4000)
{
		//boom
		var _instance = instance_create_depth(_x, _y, _depth, oAnimatedVFX);
		with(_instance)
		{
			_instance.sprite_index = _sprite;
		}

}
