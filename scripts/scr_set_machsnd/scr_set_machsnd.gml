function scr_set_machsnd(sound) {
	if machsnd == sound
		exit;
	
	if machsnd != noone
		audio_stop_sound(machsnd_play);
	
	if sound != noone {
		machsnd = sound;
		machsnd_play = audio_play_sound(sound, 0, true);
	}
	else
		machsnd = noone;
}