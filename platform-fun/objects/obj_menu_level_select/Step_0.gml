/// @description get clicks

if(global.device_left_pressed){
	var it = 0;
	for(var i = 0; i < level_amount_h; ++i){
		for(var j = 0; j < level_amount_w; ++j){
			it += 1;
			var bx = level_button_x+(level_button_margin_w+level_button_w)*j;
			var by = level_button_y+(level_button_margin_h+level_button_h)*i;

			if(global.device_x >= bx-level_button_w/2 &&
			global.device_x <= bx+level_button_w/2 &&
			global.device_y >= by-level_button_h/2 &&
			global.device_y <= by+level_button_h/2){
				with(obj_control){
					level_reset_stats();
					var rm_id = asset_get_index("rm_level_"+string(it));
					if(room_exists(rm_id))
						room_change(rm_id);
				}
			}
		}
	}
}
