get_damaged(oDamageParent, false);

//show damage
var _hp_percent = 1 - (hp/max_hp);
image_index = _hp_percent * (image_number);



#region death
	if(hp <= 0 )
	{
		//create boom
		create_animated_vfx(sSmallBoom, x+10, y+16, depth);
				
		instance_destroy();
	}
#endregion