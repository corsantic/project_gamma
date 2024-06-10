// @description check if the player is on top of the buttons and make something about it

if(image_index == 0 && place_meeting(x, y, oPlayer))
{
	ds_list_add(oSFX.sfx_list, new CreateSFX(sfxButtonPressed, 1));
	image_index = 1;
}


if(image_index == 1 && !place_meeting(x, y, oPlayer))
{
	ds_list_add(oSFX.sfx_list, new CreateSFX(sfxButtonReleased, 1));
	image_index = 0;	
	
}