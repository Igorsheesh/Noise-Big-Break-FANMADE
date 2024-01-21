function sound_play_3d(sound, x, y) {
	if live_call(sound, x, y) return live_result;
	
	return audio_play_sound_at(sound, -x, y, 1000, 1000, 0, 3, false, 0);
}

function scr_sound() {
    var snd = argument[irandom((argument_count - 1))];
	
    global.music = audio_play_sound(snd, 10, true);
    audio_sound_gain(global.music, (0.6 * global.option_music_volume), 0);
}

function scr_music(sound) {
    var m = audio_play_sound(sound, 10, true);
    audio_sound_gain(m, ((audio_sound_get_gain(sound) * 0.8) * global.option_music_volume), 0);
	
    return m;
}

function set_master_gain(argument0) {
    var num = audio_get_listener_count();
    for (var i = 0; i < num; i++) {
        var info = audio_get_listener_info(i);
        audio_set_master_gain(ds_map_find_value(info, "index"), argument0);
        ds_map_destroy(info);
    }
}