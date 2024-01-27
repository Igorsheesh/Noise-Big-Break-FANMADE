// Prevents Noisette crash
function scr_playerreset() {
	trace("playerreset");
	
	// Destroy objects
	instance_destroy(obj_noisette);
	instance_destroy(obj_music);
	instance_destroy(obj_gmlive);
	
	// Do stuff with objects
	with obj_player {
		instance_destroy();
		state = states.dead;
		room = Initroom;
		audio_pause_all();
	}
}