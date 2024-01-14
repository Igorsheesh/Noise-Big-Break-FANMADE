function sh_room_goto(argument0)
{
 // idk how to do this shit
}
function sh_get_camx(argument0) {
	return obj_camera.x
}
function sh_get_camy(argument0) {
	return obj_camera.y	
}
function sh_showcollisions(argument0) //gml_Script_sh_showcollisions
{
    showcollisions = (!showcollisions)
    event_perform(ev_other, ev_room_start)
}