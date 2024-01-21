function scr_player_slide() {
	hsp = xscale * movespeed;
	if (place_meeting(x + sign(hsp), y, obj_solid) or scr_solid_slope(x + sign(hsp), y)) && !place_meeting(x + hsp, y, obj_destroyable)
		movespeed = 0;
	
	if grounded {
		if sprite_index == spr_player_dive {
			sound_play_3d(sfx_land, x, y);
			
			state = states.normal;
			sprite_index = spr_player_runland;
			image_index = 0;
		}
		else {
			if ++part_time >= 16 {
				part_time = 0;
				create_particle(x, y, spr_dashcloud, xscale);
			}
			movespeed = Approach(movespeed, 0, 0.1);
			
			if movespeed <= 0
				state = states.normal;
			
			if input_buffer_jump {
				input_buffer_jump = 0;
				sound_play_3d(sfx_jump, x, y);
				create_particle(x, y, spr_highjumpcloud2);
			
				jumpstop = false;
				sprite_index = spr_player_longjump;
				image_index = 0;
				state = states.jump;
				vsp = -14;
				jumpclouds = 12;
			}
			scr_player_addslopemomentum(0.4, 0.2);
		}
	}
	else if place_meeting(x + sign(hsp), y, obj_solid) && !place_meeting(x + hsp, y, obj_destroyable) {
		sound_play_3d(sfx_wallslide, x, y);
		
		state = states.wallslide;
		sprite_index = spr_player_wallslide;
	}
	
}