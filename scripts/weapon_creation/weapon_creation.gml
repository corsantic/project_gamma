/// @contructor create_weapon()
function CreateWeapon(	_sprite = sPistol,
						_weapon_length = 0,
						_bullet_object = oRegularBullet,
						_cooldown = 9,
						_bullet_num = 1,
						_spread = 0,
						_pickup_sprite = sShotgunPickup,
						_shake = 1,
						_flash_sprite = sShootFlash,
						_sound_effect = sfxShotgunShot,
						_ammo = new AmmoCreation(10, 0, 30, 50, false, 10)) 
constructor
{
	sprite = _sprite;
	length = _weapon_length;
	bullet = _bullet_object;
	cooldown = _cooldown;
	bullet_num = _bullet_num;
	spread = _spread;
	pickup_sprite = _pickup_sprite;
	shake = _shake;
	flash_sprite = _flash_sprite;
    sound_effect = _sound_effect;
	ammo = _ammo;
	
}

// the player's weapon inventory
global.PlayerWeapons = array_create(0);

//the weapons
global.WeaponList = {
	pistol: new CreateWeapon(
		sPistol,
		sprite_get_bbox_right(sPistol) - sprite_get_xoffset(sPistol),
		oPistolBullet,
		12,
		1,
		0,
		sPistolPickup,
		0.5,
		sShootFlash,
		sfxPistolShot,
		new AmmoCreation(0, 0, 0, 0, true, 0, 0)
	),
	shotgun: new CreateWeapon(
		sShotgun,
		sprite_get_bbox_right(sShotgun) - sprite_get_xoffset(sShotgun),
		oMainPellet,
		20,
		10,
		70,
		sShotgunPickup,
		1.5,
		sShootFlash,
		sfxShotgunShot,
		new AmmoCreation(12, 24, 12, 84, false, 1* game_get_speed(gamespeed_fps), 30)
		),
	ak47: new CreateWeapon(
		sAk47,
		sprite_get_bbox_right(sAk47) - sprite_get_xoffset(sAk47),
		oAk47Bullet,
		9,
		1,
		0,
		sAk47Pickup,
		0.8,
		sShootFlash,
		sfxAk47Shot,
		new AmmoCreation(30, 60, 30, 150, false, 15, 30)
		)

}
	
	