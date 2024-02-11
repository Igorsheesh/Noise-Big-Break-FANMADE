function get_options() {
    ini_open("saveData.ini")
    global.option_fullscreen = ini_read_real("Option", "fullscreen", 1)
    global.option_resolution = ini_read_real("Option", "resolution", 1)
    global.option_master_volume = ini_read_real("Option", "master_volume", 1)
    global.option_music_volume = ini_read_real("Option", "music_volume", 0.85)
    global.option_sfx_volume = ini_read_real("Option", "sfx_volume", 1)
    global.option_vibration = ini_read_real("Option", "vibration", 1)
    global.option_scale_mode = ini_read_real("Option", "scale_mode", 0)
    global.option_hud = ini_read_real("Option", "hud", 1)
    global.option_lang = ini_read_string("Option", "lang", "en")
    global.option_timer = ini_read_real("Option", "timer", 0)
    global.option_speedrun_timer = ini_read_real("Option", "speedrun_timer", 0)
    global.option_timer_type = ini_read_real("Option", "timer_type", 0)
    global.option_unfocus_mute = ini_read_real("Option", "unfocus_mute", 0)
    global.option_texfilter = ini_read_real("Option", "texfilter", 1)
    global.option_vsync = ini_read_real("Option", "vsync", 0)
    global.option_screenshake = ini_read_real("Option", "screenshake", 1)
    global.lang = global.option_lang
    if is_undefined(ds_map_find_value(global.lang_map, global.lang))
        global.lang = "en"
    ini_close()
/*    screen_apply_fullscreen(global.option_fullscreen)
    obj_screensizer.start_sound = 0*/
}

function get_resolution_width(argument0, argument1 = res.wide)
{
    if (argument0 < c_black || argument0 >= array_length(global.resolutions[argument1]))
        return get_resolution_width(1, argument1);
    return global.resolutions[argument1][argument0][0];
}

function get_resolution_height(argument0, argument1 = res.wide)
{
    if (argument0 < c_black || argument0 >= array_length(global.resolutions[argument1]))
        return get_resolution_height(1, argument1);
    return global.resolutions[argument1][argument0][1];
}

function screen_apply_size()
{
    with (obj_screensizer)
    {
        if (global.option_resolution == 0)
			global.option_resolution = 1
        if (gameframe_get_fullscreen() == 0)
            gameframe_restore()
		var w = get_resolution_width(global.option_resolution, aspect_ratio)
        var h = get_resolution_height(global.option_resolution, aspect_ratio)
        trace("Setting Window Size: ", w, ", ", h)
		window_set_size(w, h)
        alarm[0] = 2
    }
}