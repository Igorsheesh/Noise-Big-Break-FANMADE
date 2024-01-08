live_auto_call;

for(var i = 0; i < max(hp, 4); i++)
	draw_sprite_ext(choose(spr_healthHUD_donut, spr_healthHUD_bnwdonut, spr_healthHUD_precle, spr_healthHUD_sandwich), 0, 32 + 78 * i, 16, 1, 1, 0, i >= hp ? c_black : c_white, 1);
draw_healthbar(32, 112, 288, 128, (movespeed / 19) * 100, c_black, c_blue, c_red, 0, true, true);

if room == Realtitlescreen || room == rm_intro || room == rm_mam0n || room == rm_disclaimer
	draw_sprite_ext(spr_null, 0, 0 + 0 * i, 0, 0, 0, 0, i >= hp ? c_black : c_white, 0);
draw_healthbar(0, 0,0 , 0, (movespeed / 19) * 100, c_black, c_black, c_black, 0, false, false);

// this is too complicated to my little brain
// someone help with this