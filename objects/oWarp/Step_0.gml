//put the player in the correct coordinates
if(room == target_rm)
{
	
	//get new coordinates and face direction from target object
		oPlayer.x = target_object.x;
		oPlayer.y = target_object.y;
		oPlayer.face = target_object.image_index;
	
}

//destroy self when done with reverse animating
if(image_speed == -1 && image_index < 1)
{
	instance_destroy();
}
