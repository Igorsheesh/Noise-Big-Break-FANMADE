function scr_player_normal() {
	hsp = xscale * movespeed;
	
	if (place_meeting(x + sign(hsp), y, obj_solid) or scr_solid_slope(x + sign(hsp), y))
	&& (!place_meeting(x + hsp, y, obj_destroyable) or movespeed <= 12)
	{
		if place_meeting(x, y + 1, obj_slope)
		{
			vsp = -movespeed;
			sound_play_3d(sfx_wallslide, x, y);
		
			state = states.wallslide;
			sprite_index = spr_player_wallslide;
			grounded = false;
			movespeed = 0;
			
			exit;
		}
		movespeed = 0;
	}
	
	if sprite_index == spr_player_stop
	{
		if image_index >= image_number - 1
		{
			image_index = 0;
			sprite_index = spr_player_idle;
		}
	}
	else if sprite_index == spr_player_turn
	{
		if image_index >= image_number - 1
			sprite_index = spr_player_mach2;
	}
	else if movespeed == 0
		sprite_index = spr_player_idle;
	
	if movespeed < 12
		mach2 = 0;

	if move != xscale && movespeed > 0
	{
		if sprite_index != spr_player_stopping
		{
			create_particle(x, y, spr_dashcloud, xscale);
			if mach2 >= mach2_time
			{
				audio_stop_sound(sfx_stop);
				sound_play_3d(sfx_stop, x, y);
			}
			sprite_index = spr_player_stopping;
		}
		mach2 = 0;
		
		movespeed = Approach(movespeed, 0, 0.7);
		if movespeed == 0 && move != 0
		{
			xscale = move;
			image_index = 0;
			sprite_index = spr_player_turn;
		}
		else if movespeed == 0
		{
			image_index = 0;
			sprite_index = spr_player_stop;
		}
	}
	else if move != 0 && !place_meeting(x + move, y, obj_solid)
	{
		if ++part_time >= 16
		{
			part_time = 0;
			create_particle(x, y, spr_dashcloud, xscale);
		}
		
		xscale = move;
		if sprite_index != spr_player_mach1 && sprite_index != spr_player_mach2 && sprite_index != spr_player_mach3 && sprite_index != spr_player_runland && sprite_index != spr_player_turn
		{
			image_index = 0;
			sprite_index = spr_player_mach1;
		}
		if image_index >= image_number - 1 && (sprite_index == spr_player_mach1 or sprite_index == spr_player_runland or sprite_index == spr_player_turn)
			sprite_index = spr_player_mach2;
		
		if mach2 < mach2_time && movespeed <= 12
		{
			if movespeed < 12
				movespeed += 0.4;
			else
				mach2++;
		}
		else
		{
			mach2 = mach2_time;
			
			sprite_index = spr_player_mach3;
			if movespeed < 16
				movespeed = Approach(movespeed, 16, 0.4);
			else if movespeed < 19
				movespeed = Approach(movespeed, 19, 0.01);
		}
		//scr_player_addslopemomentum(0.08, 0.04); //Commented out because it's a non-existant function
	}

	if input_buffer_jump
	{
		input_buffer_jump = 0;
		create_particle(x, y, spr_highjumpcloud2);
		
		jumpstop = false;
		state = states.jump;
		
		if xscale != move && move != 0
		{
			sound_play_3d(sfx_jump, x, y);
			sprite_index = spr_player_backflip;
			vsp = -16;
			xscale = move;
			movespeed = 2;
			
			jumpclouds = 10;
		}
		else if mach2 >= mach2_time
		{
			sound_play_3d(sfx_highjump, x, y);
			sprite_index = spr_player_glidejumpstart;
			vsp = -16;
			jumpclouds = 16;
		}
		else
		{
			sound_play_3d(sfx_jump, x, y);
			vsp = -14;
			
			if movespeed >= 12
			{
				sprite_index = spr_player_mach2jump;
				jumpclouds = 10;
			}
			else
				sprite_index = spr_player_jump;
		}
	}
	
	if !grounded
	{
		state = states.jump;
		sprite_index = spr_player_fall;
	}
	else if key_down
	{
		sound_play_3d(sfx_slide, x, y);
		movespeed = max(movespeed, 10);
		
		state = states.slide;
		sprite_index = spr_player_crouchslip;
	}
		
}