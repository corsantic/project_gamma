//draw the weapon behind the player
	if(aim_direction >= 0 && aim_direction < 180)
	{
		draw_player_weapon();
	}


//draw player
	draw_self();


//draw the weapon
	if(aim_direction >= 135 && aim_direction < 360)
	{
		draw_player_weapon();
	}
//draw hp as number
	
	#region draw dash sprite
		var _cd_percent = (dash_cooldown - current_cooldown) / dash_cooldown;
		var _dash_image = _cd_percent *  (sprite_get_number(sPlayerDashCd) -1); //get number of the sprites in 
		draw_sprite(sPlayerDashCd, _dash_image, x,  y - sprite_height - 1);
	#endregion

	
	

