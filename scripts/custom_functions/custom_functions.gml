/// @function							draw_player_weapon(_weapon)

function draw_player_weapon()
{
	//get the weapon of the player's body
	var _x_offset = lengthdir_x(weapon_offset_distance, aim_direction);
	var _y_offset = lengthdir_y(weapon_offset_distance, aim_direction);
	
	// flip the weapon upright
	var _weapon_y_scale = 1;
	
	if(aim_direction > 90 && aim_direction < 270)
	{
		_weapon_y_scale = -1;
	}


	draw_sprite_ext(weapon.sprite, 0, center_x + _x_offset, center_y +_y_offset, 1, _weapon_y_scale, aim_direction, c_white, image_alpha);

}

//damage calculation


	//damage create event
	/// @desc Create event for damage 
	/// @param {real} [_hp]=10 Hp of the enemy
	function get_damaged_create(_hp = 10, _iframes = false)
	{
		max_hp = _hp;
		hp = _hp;
		//get the iframes
		if(_iframes == true)
		{
			iframe_timer = 0;
			iframe_number = 90;
		}
		else
		{
			//create the damage list
			damage_list = ds_list_create();
		}
		
		
	}
	
	/**
	 * get_damaged_cleanup() Cleanup event for damage
	 */
	function get_damaged_cleanup()
	{
		//DO NOT NEED IF we're using iframes
		
		
		//delete our damage list data structure to free memory
		ds_list_clear(damage_list)
	}
	

	//damage step event
	/// @function							get_damaged(_damage_object)
	/// @description						This function is used to get damaged step event
	/// @param	{Asset.GMObject}			_damage_object		Ex. oDamagePlayer	
	/// @param	{bool}						_iframes			
	function get_damaged(_damage_object, _iframes = false)
	{
		//special exit for iframe timer
		if(_iframes == true && iframe_timer > 0)
		{
			iframe_timer--;
			if(iframe_timer mod 5 == 0)
			{
				if(image_alpha == 0)
				{
					image_alpha = 1;
				}
				else
				{
					image_alpha = 0;
				}
			}
			//clamp hp
			hp = clamp(hp, 0, max_hp);
		
			exit;
		}
		//make sure the iframe blinking stops
		if(_iframes == true)
		{
			image_alpha = 1;
		}

		//receive damage
		#region populate damage list
			if (place_meeting(x, y, _damage_object))
			{
				// getting a list of the damage instances
					//create ds list and copy instances to it
						var _instance_list = ds_list_create();
						instance_place_list(x, y, _damage_object, _instance_list, false);
			
					//get the size of our list
						var _list_size = ds_list_size(_instance_list);

					//loop all damage instances
						var _hit_confirm = false;
						
						for (var _i = 0; _i < _list_size; _i++)
						{
							//get a damage object instance from the list
							var _instance = ds_list_find_value(_instance_list, _i);
							//check if this instance is already in the damage list
							if(_iframes == true || ds_list_find_index(damage_list, _instance) == -1)
							{	
								//add the new damage instance to the damage list
								if (_iframes == false)
								{
									ds_list_add(damage_list, _instance);
								}
								
								//take damage from specific instance
								hp -= _instance.damage;
								_hit_confirm = true;
								
								//tell the damage instance to destroy itself
								_instance.hit_confirm= true;				
							}
						}
						// set iframes if we were hit
						if (_iframes == true && _hit_confirm == true)
						{
							iframe_timer = iframe_number;
						}
						
					// we dont want to have memory leak - so freeing memory
						ds_list_destroy(_instance_list); 
			}
		#endregion
		#region clear damage list
			//clear the damage list of the objects that dont exist anymore or arent touching anymore
			if(_iframes == false)
			{
				var _damage_list_size = ds_list_size(damage_list);
				for (var _i = 0; _i < _damage_list_size; _i++)
				{
					//if not touching the damage instance anymore remove it from the list AND set the loop back 1 position
					var _instance = ds_list_find_value(damage_list, _i);
					if( !instance_exists(_instance) || !place_meeting(x, y, _instance))
					{
						ds_list_delete(damage_list, _i);
						_i--;
						_damage_list_size--;
					}
		
				}
			}

		#endregion
		
		
		//clamp hp
		hp = clamp(hp, 0, max_hp);
		

	}