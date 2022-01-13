/// @description variables

global.camera = instance_create_depth(0, 0, depth, obj_camera);

//level data
levels_stats = ds_map_create(); //["rm_name"]{panda:bool, kitten:bool, puppy:bool, time:int, deaths: int}
total_deaths = 0;

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
level_reset_stats = function(){
	level_puppy_saved = false;
	level_kitten_saved = false;
	level_panda_saved = false;
	level_time = 0;
	level_failures = 0;
}