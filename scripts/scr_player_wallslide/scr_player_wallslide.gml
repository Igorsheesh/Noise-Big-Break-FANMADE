function scr_player_wallslide() {
	movespeed = 0;
	
	if ++part_time >= 8
	{
		part_time = 0;
		create_particle(x + xscale * 10, y, spr_cloudeffect);
	}
	
	if grounded
	{
		sound_play_3d(sfx_land, x, y);
		create_particle(x, y, spr_landcloud);
		state = states.normal;
	}
	vsp = min(vsp, 8);
	
	if !place_meeting(x + xscale, y, obj_solid) or move == -xscale
	{
		sprite_index = spr_player_fall;
		image_index = 0;
		state = states.jump;
	}
	else if input_buffer_jump
	{
		input_buffer_jump = 0;
		sound_play_3d(sfx_jump, x, y);

		xscale *= -1;
		movespeed = 10;
		state = states.jump;
		sprite_index = spr_player_bounce;
		vsp = -14;
	}
	
}