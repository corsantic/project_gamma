var _is_screen_paused = screen_pause();
if(_is_screen_paused) exit;

/// @description
if(instance_exists(oButton))
{
	
	//if button exist and image index is first(0) that means button is pressed
	//if button exists and image index is second(1) that means button is pressed
	state = oButton.image_index;
}

//select sprite and play sound effect
	if(state == 0)
	{
		sprite_index = sFireVentOff;
		if(audio_is_playing(sfxFireBurning))
		{
			audio_stop_sound(sfxFireBurning);
		}
		

	}
	if(state == 1)
	{
	
		sprite_index = sFireVentOn;
		if(!audio_is_playing(sfxFireBurning))
		{
			ds_list_add(oSFX.sfx_list, new CreateSFX(sfxFireBurning, 1, 1, true, 6));	
		}

	}

//depth
depth = -bbox_top;
