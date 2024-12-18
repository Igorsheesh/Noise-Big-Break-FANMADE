function scr_player_bounce() {
	hsp = xscale * movespeed;
	
	if --jumpclouds > 0 && vsp < 0 {
		if ++part_time >= (16 - jumpclouds) / 3 {
			part_time = 0;
			create_particle(x, y + 50, spr_cloudeffect);
		}
	}
	else if movespeed >= 16 {
		if ++part_time >= 8 {
			part_time = 0;
			create_particle(x, y, spr_cloudeffect);
		}
	}
	
	if !jumpstop && !key_jump2 && vsp < 0 {
		jumpstop = true;
		vsp = 0;
	}
	
	if move != xscale {
		var spd = 0.4;
		if move == 0
			spd = 0.1;
		
		movespeed = Approach(movespeed, 0, move == 0 ? 0.1 : 0.4);
		if movespeed == 0 && move != 0 && sprite_index != spr_backflip && sprite_index != spr_backflipend
			xscale = move;
	}
	else if movespeed < 10 {
		var spd = 0.4;
		if sprite_index == spr_backflip
			spd = 0.2;
		movespeed = Approach(movespeed, 10, spd);
	}
	
	if sprite_index == spr_glidejump && vsp >= 0 {
		image_index = 0;
		sprite_index = spr_glidefallstart;
	}
	
	if grounded {
		create_particle(x, y, spr_landcloud);
		sound_play_3d(sfx_land, x, y);
		
		state = states.normal;
		image_index = 0;
		sprite_index = move != 0 ? spr_runland : spr_idle;
	}
	
	if place_meeting(x + sign(hsp), y, obj_solid) && (!place_meeting(x + hsp, y, obj_destroyable) || movespeed <= 12)
	{
		if state == states.bounce
			movespeed = 0;
		else {
			sound_play_3d(sfx_wallslide, x, y);
		
			state = states.wallslide;
			sprite_index = spr_wallslide;
			vsp = min(vsp, 0);
		}
	}
	
	if movespeed > 2 && key_down2 {
		sound_play_3d(sfx_groundpound, x, y);
		
		state = states.slide;
		sprite_index = spr_dive;
		vsp = 10;
	}

}