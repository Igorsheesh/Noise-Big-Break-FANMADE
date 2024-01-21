if (wait == 0) {
	with (other) {
	    wait = 200;
	    if (character == "N")
	        character = "O";
	    else
	        character = "N";
	    scr_characterspr();
	}
}