#macro SCREEN_WIDTH 1280
#macro SCREEN_HEIGHT 720

enum res {
	wide,
	box
}

global.resolutions[res.wide] = [[480, 270], [960, 540], [1024, 576], [1280, 720], [1600, 900], [1920, 1080]];
global.resolutions[res.box] = [[640, 480], [800, 600], [1024, 768], [1152, 864], [1440, 1080]];

gameframe_init();
gameframe_caption_font = fnt_caption;
gameframe_caption_icon = spr_ico;
gameframe_caption_icon_margin = 6;
gameframe_border_width = 2;

aspect_ratio = res.wide;
ideal_width = get_resolution_width(1, aspect_ratio);
ideal_height = get_resolution_height(1, aspect_ratio);
actual_width = ideal_width;
actual_height = ideal_height;

mouse_xprevious = mouse_x;
mouse_yprevious = mouse_y;
captionalpha = 0;
disappearbuffer = 0;
depth = -9999;
var shell = instance_create_depth(0, 0, 0, obj_shell)

//__display_set_gui_size_hook(obj_screensizer.ideal_width, obj_screensizer.ideal_height)
//screen_apply_size()