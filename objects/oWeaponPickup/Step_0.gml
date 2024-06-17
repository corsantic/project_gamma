//float in place
float_direction += float_speed;
y = ystart + dsin(float_direction)*1;

//add weapon to player's list
var _is_player_contains_weapon = array_contains(global.PlayerWeapons,weapon);
//if(_is_player_contains_weapon)
//{
//	//may be dont destroy and give user ammo
//	instance_destroy();
//	exit;
//}


if (place_meeting(x, y, oPlayer))
{
		//play sfx
		ds_list_add(oSFX.sfx_list, new CreateSFX(sfxWeaponPickup, 1, 3, false));
		if(!_is_player_contains_weapon)
		{
			//add the weapon
			array_push(global.PlayerWeapons, weapon);
			
			//set as the player's weapon
			oPlayer.selected_weapon = array_length(global.PlayerWeapons) - 1;

		}
		else
		{
			weapon.ammo.add_ammo();
		}
		
		//instance destroy
		instance_destroy();
}