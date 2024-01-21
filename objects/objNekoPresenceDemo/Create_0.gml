ready = false;
if (!np_initdiscord("1192170986657816600", true, np_steam_app_id_empty)) {
	// show_error("NekoPresence init fail.", true);
	trace("NekoPresence init fail");
}