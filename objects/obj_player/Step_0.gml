live_auto_call;

if !keyboard_check(vk_control) && keyboard_check_pressed(ord("R"))
{
	ds_list_clear(global.saveroom);
	event_perform(ev_create, 0);
	targetDoor = "";
	audio_stop_all();
	room_restart();
}

key_left = -keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_up = keyboard_check(vk_up);
key_down = keyboard_check(vk_down);
key_down2 = keyboard_check_pressed(vk_down);
key_jump = keyboard_check_pressed(ord("Z"));
key_jump2 = keyboard_check(ord("Z"));
move = key_left + key_right;

if key_jump
	input_buffer_jump = 10;
if input_buffer_jump > 0
	input_buffer_jump--;

switch state
{
	case states.normal:
		scr_player_normal();
		break;
	
	case states.jump:
	case states.bounce:
		scr_player_bounce();
		break;
	
	case states.wallslide:
		scr_player_wallslide();
		break;
	
	case states.slide:
		scr_player_slide();
		break;
	
	case states.hurt:
		scr_player_hurt();
		break;
	case states.dead:
		scr_playerreset();
		break;
}

if grounded && state == states.normal
{
	if movespeed > 12
		set_machsnd(sfx_mach3);
	else if sprite_index == spr_player_mach2
		set_machsnd(sfx_mach2);
	else if sprite_index == spr_player_mach1
		set_machsnd(sfx_mach1);
	else
		set_machsnd(noone);
}
else
	set_machsnd(noone);

if state != states.jump && state != states.normal
	mach2 = 0;

if state == states.wallslide or (state == states.jump && mach2 >= mach2_time && vsp < 0)
	grav = 0.25;
else
	grav = 0.5;

// collide destructibles
if state == states.bounce
{
	with instance_place(x, y + vsp + 1, obj_destroyable)
	{
		other.vsp = -14;
		other.grounded = false;
		instance_destroy();
	}
}
if movespeed > 12 or state == states.slide
{
	with instance_place(x + hsp, y, obj_destroyable)
		instance_destroy();
	with instance_place(x, y + vsp + 1, obj_destroyable)
		instance_destroy();
}

scr_collide_player();

if inv > 0
{
	image_alpha = 1 - (floor(inv / 3) % 2);
	inv--;
}
else
{
	image_alpha = 1;
	inv = 0;
}

// spikes/enemies
var spike = instance_nearest(x, y, obj_spike);
var egg = instance_nearest(x,y,obj_enemy_egg)
if spike && abs(distance_to_object(spike)) < 1
{
	if state == states.bounce
	{
		vsp = -14;
		grounded = false;
	}
	else
		scr_hurtplayer();
}
// if egg && abs(distance_to_object(egg)) < 1
//{
//	if obj_player.movespeed = 16
//	{
//		vsp = -14;
//		grounded = false;
//	}
//	else
//		scr_hurtplayer();
//}
// debug stuff :3
if mouse_check_button_pressed(mb_left) // makes player teleport to the spot where you click with left mouse button
{
	x = mouse_x;
	y = mouse_y;
}
/*if keyboard_check(vk_f1) // makes debug objects invisible
{
	obj_solid.visible = false;
	obj_slope.visible = false;
	obj_fuckedupslope.visible = false;
	obj_convexslope.visible = false;
	obj_platform.visible = false;
	obj_spike.visible = true;
	obj_destroyable.visible = true;
	obj_mammoncube.visible = true;
	obj_enemy_egg.visible = true
}
if keyboard_check(vk_f2) // makes debug objects visible
{
	obj_solid.visible = true;
	obj_slope.visible = true;
	obj_fuckedupslope.visible = true;
	obj_convexslope.visible = true;
	obj_platform.visible = true;
}
if keyboard_check_pressed(vk_f3) //idk how to make it work lmao
{
	obj_player.sprite_index = spr_playerJ
}
if keyboard_check(vk_f4) //restarts game (self explanatory)
{
	game_restart()	
}
if keyboard_check(vk_f5) //teleports you to the test room
{
	room_goto(testroom_1)
}
if keyboard_check(vk_f6) // fullscreen
{
	gameframe_get_fullscreen()	
}
if keyboard_check(vk_f7) // gives an 1 score! (Unbeliveable!!!!!!!!!!)
	instance_create(obj_player.x, obj_player.y, obj_collect)