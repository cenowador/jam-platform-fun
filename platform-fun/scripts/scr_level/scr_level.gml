function level_end(){
	with(obj_control){
		var num = string_digits(room_get_name(room));
		var stats = {
			puppy: level_puppy_saved,
			kitten: level_kitten_saved,
			panda: level_panda_saved,
			time: level_time,
			failures: level_failures
		}
		ds_map_set(levels_stats, num, stats);
		level_reset_stats();
	}
	room_goto_next();
}

function level_failed(){
	with(obj_control){
		level_failures += 1;	
	}
	room_restart();
}

function level_got_baby(baby){
	with(obj_control){
		switch(baby){
			case babies.puppy:{
				level_puppy_saved = true;
				break;	
			}
			case babies.kitten:{
				level_kitten_saved = true;
				break;	
			}
			case babies.panda:{
				level_panda_saved = true;
				break;	
			}
		}
	}
}