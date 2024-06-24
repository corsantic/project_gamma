//sprite control
function player_sprite_control()
{

	//make sure the player is facing the correct direction
	face = round(aim_direction / degree); 
	
	if face == DIRECTION.OUT { face = DIRECTION.RIGHT; };

	//dash sprite change
	if(is_dashing)
	{
		dash_sprite_selection();
	}
	else
	{
		movement_sprite_selection();
	}


}

function dash_sprite_selection()
{
	/*	Move direction of the player. 
	*	Because we want to change player's sprite when dashing
	*/
	moving_direction = round(move_direction/ degree);
	if moving_direction ==  DIRECTION.OUT { moving_direction = DIRECTION.RIGHT; };
	sprite_index = sprites_dash[moving_direction];
}

function movement_sprite_selection()
{
		//set the player sprite
		mask_index = sprites[DIRECTION.DOWN];
		
		if(x_speed == 0 && y_speed == 0)
		{
			//animate 
			//image_index = 0;
	
			sprite_index = sprites_idle[face];
		}
		else
		{
			sprite_index = sprites[face];
		}
}

