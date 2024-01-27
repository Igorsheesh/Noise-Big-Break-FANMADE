with (other) {
    if (character == "N")
        character = "O";
    else
        character = "N";
    wait = 200;
    scr_characterspr();
    instance_destroy(other);
}