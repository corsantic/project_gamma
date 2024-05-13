//receive damage
	if (place_meeting(x, y, oDamageEnemy))
	{
		var _instance = instance_place(x, y, oDamageEnemy);
	
		//take damage from specific instance
		hp -= _instance.damage;
	
		//tell the damage instance to destroy itself
		_instance.destroy = true;
	}



//death
	if(hp <= 0 )
	{
		instance_destroy();
	}