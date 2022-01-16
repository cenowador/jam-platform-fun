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
		////keep best stats
		//var existing = levels_stats[? num];
		//if(!is_undefined(existing)){
		//	if(existing.puppy)
		//		stats.puppy = true;
		//	if(existing.kitten)
		//		stats.kitten = true;
		//	if(existing.panda)
		//		stats.panda = true;
		//	if(existing.time < stats.time)
		//		stats.time = existing.time;
		//	if(existing.failures < stats.failures)
		//		stats.failures = existing.failures;
		//}
		levels_stats[? num] = stats;
		if(num == level_current){
			level_current += 1;
		}
		level_started = false;
	}
	save_game();
	room_change(rm_level_completed);
}

function level_next(){
	with(obj_control){
		level_reset_stats();
		level_last_played += 1;
		var rm_id = asset_get_index("rm_level_"+string(level_last_played));
		if(room_exists(rm_id))
			room_change(rm_id);
	}
}

function level_failed(){
	with(obj_control){
		level_failures += 1;
		total_failures += 1;
		level_reset_stats(false, false);
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