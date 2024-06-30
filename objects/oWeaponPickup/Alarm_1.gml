/// @description alarm for weapon pickup
ready = true;
switch(floor(image_index))
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
	case 3:
		weapon = global.WeaponList.sword;
	break;
}


// set the correct sprite
sprite_index = weapon.pickup_sprite;
image_index = 0;
