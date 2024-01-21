live_auto_call

event_inherited();
switch state {
	case 1:
		player.state = states.bounce;
		player.sprite_index = obj_player.spr_bounce;
		player.movespeed = 2;
		player.vsp = -20;
		player.grounded = false;

		state = 0;
		break;
}