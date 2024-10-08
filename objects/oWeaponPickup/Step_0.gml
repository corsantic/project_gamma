var _is_screen_paused = screen_pause();
if(_is_screen_paused || !ready) exit;


//float in place
float_direction += float_speed;
y = ystart + dsin(float_direction)*1;

//add weapon to player's list
var _is_player_contains_weapon = array_contains(global.PlayerWeapons, weapon);

if (place_meeting(x, y, oPlayer))
{
		var _destroy = false;
	
		if(!_is_player_contains_weapon)
		{

			//add the weapon
			array_push(global.PlayerWeapons, weapon);
			
			//set as the player's weapon
			oPlayer.selected_weapon = array_length(global.PlayerWeapons) - 1;
			_destroy = true
		}
		else
		{
			var _is_ammo_added =  weapon.ammo.add_ammo();
			if(_is_ammo_added) 
			{
				_destroy = true;
			}
			else{
				_destroy = false;
			}
			
		}
		
		if(_destroy)
		{	
			//play sfx
			ds_list_add(oSFX.sfx_list, new CreateSFX(sfxWeaponPickup, 1, 3, false));
			//instance destroy
			instance_destroy();
		}
}