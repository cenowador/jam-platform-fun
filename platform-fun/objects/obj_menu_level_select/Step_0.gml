/// @description get clicks

level_open_button_play_hover = (global.device_x >= level_open_button_play_x-level_open_button_play_w/2 &&
			global.device_x <= level_open_button_play_x+level_open_button_play_w/2 &&
			global.device_y >= level_open_button_play_y-level_open_button_play_h/2 &&
			global.device_y <= level_open_button_play_y+level_open_button_play_h/2);
			
if(global.device_left_pressed){
	var it = 0;
	var broke = false;
	for(var i = 0; i < level_amount_h; ++i){
		for(var j = 0; j < level_amount_w; ++j){
			it += 1;
			var bx = level_button_x+(level_button_margin_w+level_button_w)*j;
			var by = level_button_y+(level_button_margin_h+level_button_h)*i;

			if(global.device_x >= bx-level_button_w/2 &&
			global.device_x <= bx+level_button_w/2 &&
			global.device_y >= by-level_button_h/2 &&
			global.device_y <= by+level_button_h/2){
				var available = false;
				with(obj_control){
					available = (it <= level_current);	
				}
				if(available){
					play_sound(snd_sound_button);
					openLevel(it);
					exit;
				}
				broke = true;
				break;
			}
		}
		if(broke)
			break;
	}
	
	//check if started playing level
	if(level_open > 0){
		if(level_open_button_play_hover){
			play_sound(snd_sound_button);
			playLevel(level_open);
			exit;
		}
	}
}
