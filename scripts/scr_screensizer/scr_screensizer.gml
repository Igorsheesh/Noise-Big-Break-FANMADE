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