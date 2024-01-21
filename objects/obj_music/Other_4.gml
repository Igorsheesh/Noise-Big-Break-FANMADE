var prevmusic = music;
if room = testroom_1
	music = mu_testroom;
if room = beach_1
	music = mu_testroom;
if room = orangetest
	music = mu_cecinestpasunechanson;
if (music != prevmusic)
{
    var prevmuID = musicID;
    musicID = scr_music(music);
    audio_stop_sound(prevmuID);
}