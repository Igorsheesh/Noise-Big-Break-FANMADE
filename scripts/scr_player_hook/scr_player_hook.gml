function scr_player_hook() {
	hsp = 0;
	vsp = 0;
	movespeed = 0;
	sprite_index = spr_fall;
	image_speed = 0.35;
	if (move != 0)
		xscale = move;
		
	var hookID = instance_place(x, y, obj_hook);
	if instance_exists(hookID) {
		x = lerp(x, hookID.x, 0.3);
		y = lerp(y, hookID.y, 0.3);
	}
	
	if key_jump {
		if instance_exists(hookID) {
			x = hookID.x;
			y = hookID.y;
		}
		vsp = 0;
		if key_jump2
			vsp = -14;
			
		jumpstop = false;
		movespeed = hookstoredmovespeed;
		//vsp = hookstoredvsp;
		sprite_index = hookstoredsprite;
		state = hookstoredstate;
		
		sound_play_3d(sfx_jump, x, y);
		if instance_exists(hookID) {
			with (hookID)
				event_user(0);
		}
	}
	exit;
}