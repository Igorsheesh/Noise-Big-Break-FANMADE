/// @description Capture async events from NekoPresence.

var ev_type = async_load[? "event_type"];

if (ev_type == "DiscordReady") {
	window_set_caption("We're ready!");
	ready = true;
	show_debug_message("date: " + string(date_current_datetime()));
	np_setpresence_timestamps(date_current_datetime(), 0, false);
	np_setpresence_more("Playing as Noise", "Secret text!!!111!!", false);
	
	//np_setpresence() should ALWAYS come the last!!
	np_setpresence("Playing", "This is an recreation with some taste of sweetnes!", "discord_rpc_noise", "");
	
	// passing a URL will add this sprite asynchronously via *internets*
	sprite_add(np_get_avatar_url(async_load[? "user_id"], async_load[? "avatar"]), 1, false, false, 0, 0);
}