/// @description sound

// get the volume
var _sfx_vol = global.sfx_volume;

//play sfx loop effects
for(var _i = 0; _i < ds_list_size(sound_effect); _i++)
{
	//play sound
	play_sfx(ds_list_find_value(sound_effect, _i), false, _sfx_vol);
}

//reset variable
ds_list_clear(sound_effect);


