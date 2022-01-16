/// @description variables

randomize();

//macros
#macro color_red "#f02837"
#macro color_red_rgb make_color_rgb(240, 40, 55)

//set cursor
cursor_sprite = spr_gui_cursor;
window_set_cursor(cr_none);

//add fonts
scribble_font_add("fnt_dotty32");

//global variables
global.game_paused = false;
global.camera = instance_create_depth(0, 0, depth, obj_camera);
global.device_left_pressed = false;
global.device_left_down = false;
global.device_x = 0;
global.device_y = 0;
global.save_location = "save";
global.options_music_on = true;
global.options_sound_on = true;
global.options_fullscreen = true;


//level data
levels_stats = ds_map_create(); //["rm_num"]{panda:bool, kitten:bool, puppy:bool, time:int, deaths: int}
total_failures = 0;

//level control
enum babies{
	puppy,
	kitten,
	panda
}
level_puppy_saved = false;
level_kitten_saved = false;
level_panda_saved = false;
level_time = 0;
level_failures = 0;
level_started = false;
level_current = 1;
level_last_played = 1;
level_reset_stats = function(reset_timer=true, reset_failures=true){
	level_puppy_saved = false;
	level_kitten_saved = false;
	level_panda_saved = false;
	if(reset_timer)
		level_time = 0;
	if(reset_failures)
		level_failures = 0;
}

//check if there is a game saved
load_game();
