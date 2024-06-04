var _is_screen_paused = screen_pause();
if(_is_screen_paused) exit;

/// @description boom damage
if(created_damage_objects == false)
{

	//create an object to damage 
	damage_instance = instance_create_depth(x, y, 0, oDamageAll);
	with(damage_instance)
	{
		damage = other.damage;
		mask_index = other.sprite_index;
		image_xscale = other.image_xscale;
		image_yscale = other.image_yscale;
	}

	
	//set create variable to true so we dont make unnecessarry damage objects
	created_damage_objects = true;
}
//get rid of the damage objects
if (floor(image_index) > 1)
{
	//destroy
	if(damage_instance)
		instance_destroy(damage_instance);
}




