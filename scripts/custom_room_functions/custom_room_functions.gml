//@description select music for the active room
function select_room_music(){
	var _room = room;
	audio_stop_all();
	switch(_room)
	{
		case Level_1:
		{
			/// @description 
			// play level 1 room music
			audio_play_sound(sfxMusicLevel_1, global.music_priority, true, global.music_volume);
			break;
		}
		case Level_2:
		{
			/// @description 
			// play level 2 room music
			audio_play_sound(sfxMusicLevel_1, global.music_priority, true, global.music_volume);
			break;
		}
		
	}
	
}