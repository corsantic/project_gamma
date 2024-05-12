/// @contructor create_weapon()

function CreateWeapon(_sprite = sPistol, _weapon_length = 0, _bullet_object = oRegularBullet, _cooldown = 9) constructor
{
	sprite = _sprite;
	length = _weapon_length;
	bullet = _bullet_object;
	cooldown = _cooldown;
}

// the player's weapon inventory
global.PlayerWeapons = array_create(0);


//the weapons
global.WeaponList = {
	pistol: new CreateWeapon(
	sPistol,
	sprite_get_bbox_right(sPistol) - sprite_get_xoffset(sPistol),
	oPistolBullet,
	15
	),
	shotgun: new CreateWeapon(
		sShotgun,
		sprite_get_bbox_right(sShotgun) - sprite_get_xoffset(sShotgun),
		oRegularBullet,
		30
		),
	ak47: new CreateWeapon(
		sAk47,
		sprite_get_bbox_right(sAk47) - sprite_get_xoffset(sAk47),
		oAk47Bullet,
		9
		)

}
	
	