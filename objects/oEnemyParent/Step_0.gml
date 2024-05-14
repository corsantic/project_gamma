//receive damage
	if (place_meeting(x, y, oDamageEnemy))
	{
		// getting a list of the damage instances
			//create ds list and copy instances to it
				var _instance_list = ds_list_create();
				instance_place_list(x, y, oDamageEnemy, _instance_list, false);
			
			//get the size of our list
				var _list_size = ds_list_size(_instance_list);
			
			
			
			//loop all damage instances
				for (var _i = 0; _i < _list_size; _i++)
				{
					//get a damage object instance from the list
					var _instance = ds_list_find_value(_instance_list, _i);
					//check if this instance is already in the damage list
					if(ds_list_find_index(damage_list, _instance) == -1)
					{	
						//add the new damage instance to the damage list
						ds_list_add(damage_list, _instance);
						
						//take damage from specific instance
						hp -= _instance.damage;
	
						//tell the damage instance to destroy itself
						//_instance.destroy = true;
					}
				}
		
			// we dont want to have memory leak - so freeing memory
				ds_list_destroy(_instance_list); 
	
	
	}
	//clear the damage list of the objects that dont exist anymore or arent touching anymore
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


//death
	if(hp <= 0 )
	{
		instance_destroy();
	}