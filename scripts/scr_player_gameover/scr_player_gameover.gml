// Prevents Noisette crash
function scr_player_gameover() {
	instance_destroy(obj_noisette);
	with obj_player {
		state = states.dead;
		instance_destroy();
	}
}