//screen pause
var _is_screen_paused = screen_pause();
if(_is_screen_paused) exit;

//fade out
alpha -= alpha_speed;

if (alpha <= 0)
{
		instance_destroy();
};
