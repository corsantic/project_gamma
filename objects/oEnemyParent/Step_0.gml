//receive damage
	get_damaged(oDamageEnemy);

//death
	#region death
		if(hp <= 0 )
		{
			instance_destroy();
		}
	#endregion