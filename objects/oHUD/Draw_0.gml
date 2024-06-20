var _cam = view_camera[0];

//get the cam coordinates
var _cam_x= camera_get_view_x(_cam);
var _cam_y= camera_get_view_y(_cam);
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
	
	#region draw the ammo count
		//if we want to top left open these
		//var _ammo_count_offset = sprite_get_height(sEnemyCountHUD) + 4
		//var _ammo_hud_x = _hud_x;
		//var _ammo_hud_y = _enemy_count_hud_y + _ammo_count_offset;
		//var _ammo_remaining = string(oPlayer.weapon.ammo.remaining_count);
		//var _ammo_spare = string(oPlayer.weapon.ammo.spare_count);
		
		//if(oPlayer.weapon.ammo.is_infinite)
		//{
		//	_ammo_remaining = "-";
		//	_ammo_spare = "-";
		//}
		
		//draw_text(_ammo_hud_x + 19, _ammo_hud_y + 3, _ammo_remaining);
		//draw_text(_ammo_hud_x + 37, _ammo_hud_y + 3, + "/" + _ammo_spare);
		//
		var _offset = 16;
		var _x_offset = _offset;
		//if(oPlayer.aim_direction < 360 && oPlayer.aim_direction > 270)
		//{
		//	_x_offset = -_x_offset;
		//}
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











