image_alpha = 0.5;
state = 0;
player = noone;
mask_index = obj_player.spr_mask;

while !scr_solid(x, y + 1)
	y++;
while scr_solid(x, y)
	y--;