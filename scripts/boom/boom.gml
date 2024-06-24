//@description boom event for explosion of the objects
function boom(_image_xscale = 1.2, _image_yscale = 1.2){
		//create explosion
		var _boom_instance = instance_create_depth(x + 8, y + 8, -3000, oBigBoom);
		with(_boom_instance)
		{
			image_xscale = _image_xscale;
			image_yscale = _image_yscale;
		}
		//play sound
		ds_list_add(oSFX.sfx_list, new CreateSFX(sfxExplosion));	
		
		//screen pause
		create_screen_pause_timed();
		
		
		//camera shake
		camera_shake(8);
		
		//destroy self
		instance_destroy();
}