if !(room == Realtitlescreen || room == rm_intro || room == rm_mam0n || room == rm_disclaimer)
{
	// Health
	for (var i = 0; i < max(hp, 4); i++)
		draw_sprite_ext(spr_healthHUD, i, 32 + 78 * i, yy, 1, 1, 0, i >= hp ? c_black : c_white, 1);
		
	// Speedomiter
	draw_healthbar(32, 112, 288, 128, (movespeed / 19) * 100, c_black, c_blue, c_red, 0, true, true);
	
	//draw_healthbar(0, 0, 0, 0, (movespeed / 19) * 100, c_black, c_black, c_black, 0, false, false);
}