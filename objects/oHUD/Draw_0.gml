var _cam = view_camera[0];

//get the cam coordinates
var _cam_x= camera_get_view_x(_cam);
var _cam_y= camera_get_view_y(_cam);
var _cam_height = camera_get_view_height(_cam);
var _cam_width = camera_get_view_width(_cam);

//central HUD coordinates
var _padding = 8;
var _hud_x = _cam_x + _padding;
var _hud_y = _cam_y + _padding;
	
//draw the player's hp
if (instance_exists(oPlayer))
{
	#region draw player hp
		var _seperation = 3;

		draw_sprite(sPlayerHpBar, 0, _hud_x, _hud_y);
	
		for (var _i = 0; _i < player_max_hp; _i++)
		{
			//show current hp
			var _image_of_bar = 1;
			if ( _i+1 <= player_hp ) { _image_of_bar = 2; }
		
			draw_sprite(sPlayerHpBar, _image_of_bar, _hud_x + _seperation*_i, _hud_y)
		}
	
	#endregion

	#region draw the enemy kill count
		var _enemy_count_offset = sprite_get_height(sPlayerHpBar) + 4; //sprite height of the splayerhpbar plus offset
		var _enemy_count_hud_x = _hud_x;
		var _enemy_count_hud_y = _hud_y + _enemy_count_offset;
		//draw the background/box
		draw_sprite(sEnemyCountHUD, 0, _enemy_count_hud_x, _enemy_count_hud_y);
		//draw the text
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		
		//the current enemy kill count
		draw_text(_enemy_count_hud_x + 19, _enemy_count_hud_y + 3, string(global.enemy_kill_count))
		//total enemies in level count
		draw_text(_enemy_count_hud_x + 37, _enemy_count_hud_y + 3, + "/" + string(global.enemy_room_max))

	#endregion
	
	if(oPlayer.weapon.type == WEAPON_TYPE.RANGED)
	{
		#region draw the ammo count	
			var _offset = 16;
			var _x_offset = _offset;
	
			var _ammo_hud_x = oPlayer.x + _x_offset;
			var _ammo_hud_y = oPlayer.center_y + _offset;
			var _ammo_remaining = string(oPlayer.weapon.ammo.remaining_count);
			var _ammo_spare = string(oPlayer.weapon.ammo.spare_count);
		
			if(oPlayer.weapon.ammo.is_infinite)
			{
				_ammo_remaining = "-";
				_ammo_spare = "-";
			}
		
			draw_text(_ammo_hud_x, _ammo_hud_y, _ammo_remaining);
			draw_text(_ammo_hud_x + 20, _ammo_hud_y, + "/" + _ammo_spare);
	
	
		#endregion
	
	}
	
	#region draw weapons to ui
		var _x_scale = 2;
		var _y_scale = 2;
		var _weapon_ui_x = (_cam_x + _cam_width/2 - (sprite_get_width(sPlayerWeapons)/2) * _x_scale);
		var _weapon_ui_y = (_cam_y + camera_get_view_height(_cam) - (sprite_get_height(sPlayerWeapons)) * _y_scale);
	
		
		var _player_weapons = global.PlayerWeapons;
		
		var _weapon_sprite_offset = 0;
		
		var _weapon_list = global.WeaponList;
		var _total_weapons = variable_struct_get_names(global.WeaponList);
		var _weapon_between_offset = 0;
		
		for (var _j = 0; _j < array_length(_total_weapons); _j++)
		{
			var _key = _total_weapons[_j];
			var _value = _weapon_list[$ _key];
			var _weapon_sprite_width = sprite_get_width(_value.ui_sprite) * _x_scale;

			for (var _k = 0; _k < _weapon_sprite_width-1; _k++)
			{
				var _background_offset = ((_k)) + _weapon_between_offset;
				//draw hud for current weapon
				draw_sprite_ext(sPlayerWeapons,
					1, 
					_weapon_ui_x + _background_offset,
					_weapon_ui_y,
					_x_scale,
					_y_scale,
					0, c_white, 1);
				
			}
			_weapon_between_offset += (_weapon_sprite_width + (_weapon_sprite_offset * _x_scale));
		}
			
		//draw the first line
		draw_sprite_ext(sPlayerWeapons, 0, _weapon_ui_x, _weapon_ui_y, _x_scale, _y_scale, 0, c_white, 1);
		
		var _text_x_offset = 5;
		var _text_y_offset = 10;
		// draw weapons sprites for ui
		for(var _i = 0; _i < array_length(_player_weapons); _i++)
		{	
			var _weapon = _player_weapons[_i];
			var _weapon_sprite = _weapon.ui_sprite;
			var _text_location = _weapon_ui_y + sprite_get_height(_weapon_sprite) * _y_scale - _text_y_offset;
			
			// Calculate the offset for this weapon, adding some spacing
			var _current_offset = _weapon_sprite_offset * _x_scale;
			
			draw_sprite_ext(_weapon_sprite,
							0,
							_weapon_ui_x + _current_offset,
							_weapon_ui_y,
							_x_scale,
							_y_scale,
							0, c_white, 1);
			//draw text of the weapon selection 1, 2, 3
			draw_text(_weapon_ui_x + _current_offset + _text_x_offset, _text_location, string(_i+ 1));
			
			// Update the offset for the next weapon
			_weapon_sprite_offset += sprite_get_width(_weapon_sprite);
		}
		
	#endregion
}











