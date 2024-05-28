//float in place
float_direction += float_speed;
y = ystart + dsin(float_direction)*2; 



if (place_meeting(x, y, oPlayer))
{
	//heal the player
	if(oPlayer.hp < oPlayer.max_hp )
	{	
		oPlayer.hp += heal;
		instance_destroy();
	}
}