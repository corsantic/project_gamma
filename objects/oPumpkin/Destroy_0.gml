//get rid of bullet if we haven't shot it yet
if (instance_exists(bullet_instance) 
	&& bullet_instance.state = BULLET_STATE.NOT_MOVING)
{
	bullet_instance.destroy = true;
}


//boom for pumpkin
play_sfx(sfxPumpkinPop);

instance_create_depth(x, y, depth, oPumpkinBomb);