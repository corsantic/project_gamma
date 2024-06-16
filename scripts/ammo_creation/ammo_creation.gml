//@description store ammo values
//@param	_remaining_count	remaining count in magazine
//@param	_max_count		max ammo count
function AmmoCreation(	_remaining_count,
						_spare_count,
						_magazine_size,
						_max_count,
						_is_infinite)
constructor
{
	remaining_count = _remaining_count;
	spare_count= _spare_count;
	magazine_size = _magazine_size;
	max_count = _max_count;
	is_infinite = _is_infinite;
	//@description Add ammo to remaining_count
	//@param	_add_count		add count when ammo picked up from a gun
	static add_ammo = function(_ammo_count)
	{
		if(is_infinite) return;
		if((remaining_count + spare_count) == max_count) return;
		spare_count += _ammo_count
	}
	
	static shoot = function()
	{
		if(is_infinite) return;
		if(remaining_count <= 0) 
		{
			reload();
			return;
		}
		remaining_count -= 1;
	}
	
	
	static reload = function()
	{
		if(is_infinite || remaining_count == magazine_size) return;
		
		var _reload_count = magazine_size - remaining_count;
		
		if(spare_count < _reload_count)
		{
			_reload_count = spare_count;
		}
		
		spare_count -= _reload_count;
		
		remaining_count = magazine_size;
		
		
		
		
	}


}