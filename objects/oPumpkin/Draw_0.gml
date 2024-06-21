//draw self flipped the right way
	draw_sprite_ext(sprite_index,
					image_index,
					x,
					y,
					image_xscale,
					image_yscale,
					image_angle,
					image_blend,
					image_alpha);


//draw hp
	var _hp_percent = hp / max_hp;
	var _hp_image = _hp_percent *  (sprite_get_number(sEnemyHealth) -1); //get number of the sprites in 
	draw_sprite_ext(sEnemyHealth,
					_hp_image,
					x,
					y - sprite_height - 1,
					image_xscale,
					image_yscale,
					image_angle,
					image_blend,
					image_alpha);
