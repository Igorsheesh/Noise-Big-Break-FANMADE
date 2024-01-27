/// @description Initialize Discord.

#macro DISCORD_APP_ID "1200887171868000306" // 1192170986657816600

ready = false;
if (!np_initdiscord(DISCORD_APP_ID, true, np_steam_app_id_empty)) {
	//show_error("NekoPresence init fail.", true);
	trace("NekoPresence init fail!");
}