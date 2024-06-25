var _is_screen_paused = screen_pause();
if(_is_screen_paused) exit;


//float and gravity
z += z_speed;
z_speed -= grav;

depth = -y;

//explode
if(z <= 0)
{
	boom(1, 1);
}
