// @description custom sfx functions - so it can be more customizable
function play_sfx(	_sound_effect,
					_loops = false,
					_sfx_volume = 1,
					_sfx_pitch = random_range(0.8, 1.2),
					_priority = global.sound_effect_priority)
{
	if(global.is_sfx_on)
	{
		//play sound effect
		var _sfx_instance = audio_play_sound(_sound_effect, global.sound_effect_priority, _loops);
		audio_sound_gain(_sfx_instance, _sfx_volume, 0);	
		audio_sound_pitch(_sfx_instance, _sfx_pitch);
	}
}


//@description for stopping given sfx
function stop_sfx( _sound_effect)
{
	if(audio_is_playing(_sound_effect))
	{
		audio_stop_sound(_sound_effect);
	}

}