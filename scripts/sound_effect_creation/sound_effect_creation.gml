//@description Create sound effect with constructor
function CreateSFX(	_sfx, 
					_pitch = random_range(0.8, 1.2),
					_volume_multiplier = 1, 
					_loop = false,
					_priority = global.sound_effect_priority) 
constructor
{
	sfx = _sfx;
	pitch = _pitch;
	volume_multiplier = _volume_multiplier;
	loop = _loop;
	priority = _priority 
}
