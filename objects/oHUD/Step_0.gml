//make sure player exists and store hp values
if(instance_exists(oPlayer))
{
	player_hp = oPlayer.hp;
	player_max_hp = oPlayer.max_hp;
}
else{
	player_hp = 0;
}