//receive damage
	get_damaged(oDamageEnemy);

//death
	#region death
		if(hp <= 0 )
		{
			state = ENEMY_STATE.DEATH;
		}
	#endregion