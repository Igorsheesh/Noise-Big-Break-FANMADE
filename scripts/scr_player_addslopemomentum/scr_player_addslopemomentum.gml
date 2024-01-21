function scr_player_addslopemomentum(acc, dec) {
	with (instance_place(x, y + 1, obj_slope)) {
		if sign(image_xscale) == -sign(other.xscale) && other.movespeed < 19
			other.movespeed += acc;
		else if other.movespeed > 12
			other.movespeed -= dec;
	}
}