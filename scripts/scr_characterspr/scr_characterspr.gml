function scr_characterspr() {
	spr_mach1 = spr_player_mach1;
	spr_dive = spr_player_dive;
	spr_runland = spr_player_runland;
	spr_longjump = spr_player_longjump;
	spr_longjumpend = spr_player_longjumpend;
	spr_wallslide = spr_player_wallslide;
	spr_bounce = spr_player_bounce;
	spr_stop = spr_player_stop;
	spr_idle = spr_player_idle;
	spr_turn = spr_player_turn;
	spr_mach2 = spr_player_mach2;
	spr_stopping = spr_player_stopping;
	spr_mach3 = spr_player_mach3;
	spr_runland = spr_player_runland;
	spr_glidejumpstart = spr_player_glidejumpstart;
	spr_mach2jump = spr_player_mach2jump;
	spr_jump = spr_player_jump;
	spr_fall = spr_player_fall;
	spr_crouchslip = spr_player_crouchslip;
	spr_backflip = spr_player_backflip;
	spr_glidejump = spr_player_glidejump;
	spr_glidefallstart = spr_player_glidefallstart;
	spr_glidefall = spr_player_glidefall;
	spr_mach2fall = spr_player_mach2fall;
	spr_hurt = spr_player_hurt;
	spr_mask = spr_player_mask;
	switch obj_player.character {
		case "O":
			spr_mach1 = spr_playerO_mach2; // Mach 1 is Works In Progress
			spr_dive = spr_player_dive;
			spr_runland = spr_playerO_machland;
			spr_longjump = spr_player_longjump;
			spr_longjumpend = spr_player_longjumpend;
			spr_wallslide = spr_player_wallslide;
			spr_bounce = spr_player_bounce;
			spr_stop = spr_player_stop;
			spr_idle = spr_playerO_idle;
			spr_turn = spr_playerO_turn;
			spr_mach2 = spr_playerO_mach2;
			spr_stopping = spr_playerO_slidestart;
			spr_mach3 = spr_playerO_mach3;
			spr_glidejumpstart = spr_playerO_jump;
			spr_mach2jump = spr_playerO_jump;
			spr_jump = spr_player_jump;
			spr_fall = spr_player_fall;
			spr_crouchslip = spr_player_crouchslip;
			spr_backflip = spr_player_backflip;
			spr_glidejump = spr_playerO_jump;
			spr_glidefallstart = spr_playerO_jump;
			spr_glidefall = spr_playerO_jump;
			spr_mach2fall = spr_playerO_jump;
			spr_slidestart = spr_playerO_slidestart;
			spr_hurt = spr_player_hurt;
			spr_mask = spr_player_mask;
			break;
	}
}