enum states {
	normal,
	mach,
	jump,
	slide,
	hurt,
	wallslide,
	bounce,
	actor,
	hitstun,
	dead
}
#macro mach2_time 30

key_left = false;
key_right = false;
key_up = false;
key_down = false;
key_down2 = false;
key_jump = false;
key_jump2 = false;
move = key_left + key_right;
depth = -6;
hp = 4;
image_speed = 0.35;
hsp = 0;
vsp = 0;
grounded = false;
grav = 0.5;
state = states.normal;
hsp_carry = 0;
vsp_carry = 0;
platformid = noone;
xscale = 1;
yscale = 1;
movespeed = 0;
mach2 = 0;
jumpstop = false;
inv = 0;
character = "N";
scr_characterspr();

input_buffer_jump = 0;

verticalpos = 0;
verticalspd = 0;

targetRoom = 0;
targetDoor = "A";

// effects
machsnd = noone;
machsnd_play = noone;
part_time = 0;
jumpclouds = 0;

/*if keyboard_check(vk_f7) {
	// add here so debug blocks will be invisible
}*/

ini_open("saveData.ini");
global.option_fullscreen = ini_read_real("Option", "fullscreen", 1);
global.option_resolution = ini_read_real("Option", "resolution", 1);
global.option_master_volume = ini_read_real("Option", "master_volume", 1);
global.option_music_volume = ini_read_real("Option", "music_volume", 1);
global.option_sfx_volume = ini_read_real("Option", "sfx_volume", 1);
global.option_vibration = ini_read_real("Option", "vibration", 1);
ini_close();