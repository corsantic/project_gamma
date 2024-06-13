if (place_meeting(x, y, oPlayer))
{
	room_goto(target_rm);
	oPlayer.x = target_x;
	oPlayer.y = target_y;
}