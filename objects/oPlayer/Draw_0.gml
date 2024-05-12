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
