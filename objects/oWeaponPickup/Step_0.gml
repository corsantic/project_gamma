//float in place
float_direction += float_speed;
y = ystart + dsin(float_direction)*1; 


//add weapon to player's list

if (place_meeting(x, y, oPlayer))
{
	//add the weapon
	array_push(global.PlayerWeapons, weapon);
	
	//set as the player's weapon
	oPlayer.selected_weapon = array_length(global.PlayerWeapons) - 1;
	
	
	//instance destroy
	instance_destroy();
	
}