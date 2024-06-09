get_damaged(oDamageParent, false);

//show damage
var _hp_percent = 1 - (hp/max_hp);
image_index = _hp_percent * (image_number);


#region death
	if(hp <= 0 )
	{
		//create explosion
		var _boom_instance = instance_create_depth(x + 8, y + 8, -3000, oBigBoom);
		with(_boom_instance)
		{
			image_xscale = 1.2;
			image_yscale = 1.2;
		}
		//play sound
		ds_list_add(oSFX.sound_effect, sfxExplosion);	
		
		//screen pause
		create_screen_pause_timed();
		
		
		//camera shake
		camera_shake(8);
		
		//destroy self
		instance_destroy();
	}
#endregion