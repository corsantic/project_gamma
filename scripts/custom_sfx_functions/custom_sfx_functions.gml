// @description custom sfx functions - so it can be more customizable
function play_sfx(_sound_effect, _loops = false){
	if(global.is_sfx_on)
	{
		//play sound effect
		audio_play_sound(_sound_effect, global.sound_effect_priority, _loops);
	}	
}