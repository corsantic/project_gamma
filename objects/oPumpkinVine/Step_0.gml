//pause self
var _is_screen_paused = screen_pause();
if(_is_screen_paused) exit;

if(delay > 0)
{
	delay--;
	image_index = 0;
	exit;
}


//create damage object
if(floor(image_index) == attack_frame && !instance_exists(damage_object))
{
	damage_object = instance_create_depth(x, y, depth, oDamagePlayer);
	with(damage_object)
	{
		mask_index = other.sprite_index;
		damage = other.damage;
		visible = false;
	
	}
}

if (floor(image_index) > hold_frame)
{
	hold_time--;
	if(hold_time > 0)
	{
		image_index = hold_frame;
	}
}



//getting rid of the damage object
if(floor(image_index) > hold_frame && instance_exists(damage_object))
{
	instance_destroy();
}
