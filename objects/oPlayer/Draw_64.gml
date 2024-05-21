	
	#region draw player hp
		var _hp_percent = hp/ max_hp;
		var _hp_image = _hp_percent * (sprite_get_number(sPlayerHp) - 1)
		draw_sprite_ext(sPlayerHp, _hp_image, 0, 0, 14, 14, 0, c_white, 1)
	
	
	
	#endregion
	