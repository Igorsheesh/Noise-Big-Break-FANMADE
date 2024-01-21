var dir = point_direction(x, y, other.x, other.y);
with other
{
	state = states.bounce;
	sprite_index = obj_player.spr_bounce;
	grounded = false;
	
	hsp = lengthdir_x(12, dir);
	vsp = lengthdir_y(12, dir);
	if hsp != 0
		xscale = sign(hsp);
	movespeed = abs(hsp);
}