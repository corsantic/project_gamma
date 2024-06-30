//get inputs
var _right_key = global.right_key;
var _left_key =	global.left_key;
var _up_key = global.up_key;
var _down_key = global.down_key;
var _shoot_key = global.shoot_key;
var _swap_down_key_pressed = global.swap_down_key;
var _swap_up_key_pressed = global.swap_up_key;
var _start_key_pressed = global.start_key_pressed;
var _reload_key_pressed = global.reload_key_pressed;


if(instance_exists(oWarp))
{
	image_index = 0;
	sprite_index = sprites_idle[face];
	aim_direction = face * _degree;
	center_y = y + center_y_offset;
	
}

#region pause game
//pause menu
if(_start_key_pressed)
{
		if(!instance_exists(oPauseMenu))
		{
			instance_create_depth(0, 0, 0, oPauseMenu);
		}
		else{
			instance_destroy(oPauseMenu);
		}
}


//pause self
var _is_screen_paused = screen_pause();
if(_is_screen_paused) exit;

#endregion

#region player movement
	player_movement();
	
	//depth
	depth = -bbox_bottom;
#endregion

#region get damaged
	if (get_damaged(oDamagePlayer, true))
	{
		//sound
		ds_list_add(oSFX.sfx_list, new CreateSFX(sfxGetDamaged, 1, 4));
		
		//hit screen
		instance_create_depth(0, 0, 0, oHitScreen);
		
		//screen shake
		camera_shake(6);
		
		//screen pause
		create_screen_pause_timed(25);
	}
#endregion

#region player aiming
	player_aiming();
#endregion

#region sprite control
	player_sprite_control();

#endregion
#region weapon swapping
	var _player_weapons = global.PlayerWeapons;
	var _weapon_selected_key = global.weapon_selected_key;
	
	//cycle through weapons
	if(_swap_down_key_pressed || _swap_up_key_pressed || _weapon_selected_key != 0)
	{
		//change the selection and wrap around
		if(_swap_up_key_pressed) selected_weapon++;
		if(_swap_down_key_pressed) selected_weapon--;
	
		if(_weapon_selected_key != 0)
		{	
			// -1 because its start from 1
			selected_weapon = _weapon_selected_key - 1;
			// set back to zero after weapon selected 
			global.weapon_selected_key = 0;
		}
		else
		{
			if(selected_weapon < 0)
			{	
				selected_weapon = array_length(_player_weapons) - 1;
			}
			if(selected_weapon >= array_length(_player_weapons)) 
			{ 
				selected_weapon = 0;
			}
		}
		reload_cancel = true;
	}
	
	//set the new weapon
	weapon = _player_weapons[selected_weapon];
	

#endregion
if(shoot_timer > 0) { shoot_timer--; }
var _is_shoot_ready_and_pressed = _shoot_key && shoot_timer <= 0;

//check for ranged weapon
switch(weapon.type)
{
	case WEAPON_TYPE.RANGED:
	{
		#region reload
			if (reload_cancel) {
			    alarm[0] = -1; // Cancel the reload alarm
			    is_reloading = false;
			    stop_sfx(sfxReload);
			    reload_cancel = false;
			} else {
			    if ((_reload_key_pressed || weapon.ammo.is_magazine_empty()) 
					&& weapon.ammo.spare_count > 0 
					&& alarm[0] == -1 
					&& !is_reloading) {
			        alarm[0] = weapon.ammo.reload_time; // Set the alarm to the reload time
			        play_sfx(sfxReload, true);
			        is_reloading = true;
			    }
			}

		#endregion
 		#region shoot the weapon if not melee


			if(_is_shoot_ready_and_pressed && !is_reloading && !weapon.ammo.is_magazine_empty())
			{
				//reset the timer
				shoot_timer = weapon.cooldown;
				//shoot and substract ammo
				weapon.ammo.shoot();

				//camera shake
				camera_shake(weapon.shake);
	
				//shooting
					//create the bullet
					var _weapon_net_length = weapon.length + weapon_offset_distance;
					var _x_offset = lengthdir_x(_weapon_net_length, aim_direction);
					var _y_offset = lengthdir_y(_weapon_net_length, aim_direction);
		
					var _spread = weapon.spread;
					var _spread_div = _spread / max(weapon.bullet_num - 1, 1);
		
					var _weapon_tip_x = center_x + _x_offset;
					var _weapon_tip_y = center_y + _y_offset;
		
					//play sound effect
					ds_list_add(oSFX.sfx_list, new CreateSFX(weapon.sound_effect));
		
					//create weapon flash
					create_animated_vfx(weapon.flash_sprite,
										_weapon_tip_x,
										_weapon_tip_y,
										depth - 10,
										aim_direction);
		
		
					//create the correct number of bullets
					for(var _i = 0; _i < weapon.bullet_num; _i++)
					{
			
						var _bullet_instance = instance_create_depth(_weapon_tip_x, _weapon_tip_y,
																	depth, weapon.bullet);
	
						//change the bullet's direction
						with(_bullet_instance)
						{
							dir = other.aim_direction - _spread/2 + _spread_div*_i;		
				
							// turn the bullet to correct direction at creation if necessary
							if(dir_fix == true){ image_angle = dir; }
						}
			
					}
			}
			else if (_is_shoot_ready_and_pressed && weapon.ammo.is_magazine_empty() && !is_reloading)
			{
				//play empty magazine
				alarm[1] = 2;
			}
		#endregion
		break;
	}
	case WEAPON_TYPE.MELEE:
	{

		if(_is_shoot_ready_and_pressed && !is_melee_attacking)
		{
			//reset the timer
			shoot_timer = weapon.cooldown;
			
			is_melee_attacking = true;
			var _weapon_net_length = weapon.length + weapon_offset_distance;
			var _x_offset = lengthdir_x(_weapon_net_length, aim_direction);
			var _y_offset = lengthdir_y(_weapon_net_length, aim_direction);
			var _hitbox = instance_create_depth(x + _x_offset, y + _y_offset, depth, oHitBox);
			
			with(_hitbox)
			{
				sprite_index = sSword;
				image_xscale = other.image_xscale;
				damage = other.weapon.damage;
			}
		}
		
		if(is_melee_attacking)
		{
			melee_attack_timer += weapon.attack_speed;
			if (melee_attack_timer >= 1) {
		        attack_frame++;
		        melee_attack_timer = 0; // Reset the timer
		    }

		    var _sprite_numbers = sprite_get_number(weapon.sprite);
		    if (attack_frame >= _sprite_numbers) {
		        attack_frame = 0;
		        is_melee_attacking = false;
		    }
		}

		break;
	}
}

#region death / gameover
	if(hp <= 0)
	{	
		//create the game over
		instance_create_depth(0, 0, -10000,oGameOverScreen);
		
		//boom vfx
		create_animated_vfx(sSmallBoom, x, y, depth);
		
		
		
		//destroy ourself
		instance_destroy();
	}
#endregion