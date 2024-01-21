function scr_hurtplayer() {
	if state == states.hurt or inv > 0
		exit;
	
	hp--;
	if hp <= 0
		scr_playerreset();
	
	sound_play_3d(sfx_hurt, x, y);
	grounded = false;
	movespeed = 0;
	hsp = xscale * -6;
	vsp = -10;
	state = states.hurt;
	sprite_index = spr_player_hurt;
}