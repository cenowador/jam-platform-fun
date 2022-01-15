function save_game(){
	var f = file_text_open_write(global.save_location);
	if(f > -1){
		var content = ds_map_create();
		with(obj_control){
			content[? "level"] = level_current;
			//iterates over ds map to preserve structs
			var keys = ds_map_keys_to_array(levels_stats);
			var keysLeng = array_length(keys);
			var mapCopy = ds_map_create();
			for(var i = 0; i < keysLeng; ++i){
				var val = ds_map_find_value(levels_stats, keys[i]);
				if(is_struct(val))
					val = struct_to_array(val);
				ds_map_set(mapCopy, keys[i], val);
			}
			content[? "level_stats"] = ds_map_write(mapCopy);
		}
		file_text_write_string(f, ds_map_write(content));
		ds_map_destroy(content);
		file_text_close(f);
	}
}

function load_game(){
	if(file_exists(global.save_location)){
		var f = file_text_open_read(global.save_location);
		if(f > -1){
			var content = ds_map_create();
			try{
				ds_map_read(content, file_text_read_string(f));
				with(obj_control){
					if(ds_map_exists(content, "level")){
						level_current = content[? "level"];
					}
					if(ds_map_exists(content, "level_stats")){
						var stats = ds_map_create();
						ds_map_read(stats, content[? "level_stats"]);
						//convert arrays back to structs
						var keys = ds_map_keys_to_array(stats);
						var keysLeng = array_length(keys);
						for(var i = 0; i < keysLeng; ++i){
							var val = ds_map_find_value(stats, keys[i]);
							if(is_array(val)){
								var s = {};
								array_to_struct(val, s);
								ds_map_set(stats, keys[i], s);
							}
						}
						levels_stats = stats;
					}
				}
			}
			catch(err){
				show_debug_message(err);
				file_delete(global.save_location);
			}
			ds_map_destroy(content);
			file_text_close(f);
		}
	}
}
