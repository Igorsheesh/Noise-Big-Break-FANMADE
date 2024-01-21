if instance_exists(obj_player)
{
	if obj_player.character = "O" {
		if !audio_exists(orangemusicID) {
		    orangemusicID = scr_music(mu_sundogfunk);
			prevmusictime = audio_sound_get_track_position(musicID);
		    audio_sound_set_track_position(orangemusicID, 0);
		    audio_pause_sound(musicID);
		}
	}
	else {
		if !audio_exists(musicID)
		{
			audio_sound_set_track_position(musicID, prevmusictime)
			audio_resume_sound(musicID);
			audio_stop_sound(orangemusicID);
		}
	}
}