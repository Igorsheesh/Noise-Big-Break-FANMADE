// Prevents Noisette crash
function scr_playerreset() {
	trace("playerreset");
	instance_destroy(obj_noisette);
	with obj_player {
		state = states.dead;
		instance_destroy();
	}
}