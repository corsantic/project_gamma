depth = -y;

weapon = global.WeaponList.shotgun;


//floating
float_direction = 0;
float_speed = 6;

switch(image_index)
{
	case 0:
		weapon = global.WeaponList.pistol;
	break;
	case 1:
		weapon = global.WeaponList.shotgun;
	break;
	case 2:
		weapon = global.WeaponList.ak47;
	break;
}


// set the correct sprite
sprite_index = weapon.pickup_sprite;
image_index = 0;


var _is_player_contains_weapon =  array_contains(global.PlayerWeapons, weapon);

//if(_is_player_contains_weapon)
//	instance_destroy();
	
