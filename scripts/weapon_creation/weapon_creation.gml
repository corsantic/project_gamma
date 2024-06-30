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
						_ammo = new AmmoCreation(10, 0, 30, 50, false, 10),
						_ui_sprite = sShotgunHUD
						)
constructor
{
	type = WEAPON_TYPE.RANGED;
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
	ui_sprite = _ui_sprite;
}

/// @constructor CreateMeleeWeapon()
function CreateMeleeWeapon(	_sprite = sSword,
							_weapon_length = 0,
							_damage = 10,
							_cooldown = 15,
							_pickup_sprite = sSwordPickup,
							_sound_effect = sfxPistolShot,
							_ui_sprite = sSwordHUD,
							_attack_speed = 0.2
							)
constructor
{
	type = WEAPON_TYPE.MELEE;
	sprite = _sprite;
	length = _weapon_length;
	damage = _damage;
	cooldown = _cooldown;
	pickup_sprite = _pickup_sprite;
	sound_effect = _sound_effect;
	ui_sprite = _ui_sprite;
	attack_speed = _attack_speed;
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
		new AmmoCreation(0, 0, 0, 0, true, 0, 0),
		sPistolHUD
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
		new AmmoCreation(12, 24, 12, 84, false, 1* game_get_speed(gamespeed_fps), 30),
		sShotgunHUD
		//new AmmoCreation(3, 0, 12, 84, false, 1* game_get_speed(gamespeed_fps), 0)
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
		new AmmoCreation(30, 60, 30, 150, false, 15, 30),
		sAk47HUD
		),
	sword: new CreateMeleeWeapon(
        sSwordAttack, // Replace with your melee weapon sprite
        sprite_get_bbox_right(sSwordAttack) - sprite_get_xoffset(sSwordAttack), // Length of the melee weapon
        10, // Damage of the melee weapon
        15, // Cooldown for melee attack
        sSwordPickup, // Replace with your melee weapon pickup sprite
        sfxPistolShot, // Replace with your melee weapon sound effect
        sSwordHUD, // Replace with your melee weapon HUD sprite
		0.15 // attack speed
    )

}
	
	