
//spawn an enemy
	timer++;
	
	//reset timer when enemy limits have been reached
	if(instance_number(oEnemyParent) >= global.active_enemy_max || global.total_enemies_spawned >= global.enemy_room_max)
	{
		timer = 0;
	}
	
	
	if (timer >= spawn_time && !place_meeting(x, y+16, oSkeleton))
	{
		//create an enemy
		var _instance = instance_create_depth(x, y, depth-1, oSkeleton);
		with(_instance)
		{
			//make skeleton invisible
			image_alpha = 0;
			state = ENEMY_STATE.SPAWN;
		}
	
	
		//reset the timer
		timer = 0;
	}