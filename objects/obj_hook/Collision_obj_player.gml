if (other.character = "O" && (activated && other.state != states.hook && other.state != states.hurt)) {
	with obj_player {
		hookstoredmovespeed = movespeed
		hookstoredvsp = vsp
		hookstoredsprite = sprite_index
		hookstoredstate = state
		state = states.hook
		hookID = other.id
	}
}