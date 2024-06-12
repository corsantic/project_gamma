/// @description sound

// get the volume
var _sfx_vol = global.sfx_volume * global.master_volume;
var _sfx_list_length = ds_list_size(sfx_list);
//play sfx loop effects
for(var _i = 0; _i < _sfx_list_length; _i++)
{
	//play sound
	var _sfx_value = ds_list_find_value(sfx_list, _i);
	play_sfx(_sfx_value.sfx, _sfx_value.loop,
	_sfx_vol * _sfx_value.volume_multiplier,
	_sfx_value.pitch, _sfx_value.priority);
}

//reset variable
ds_list_clear(sfx_list);


