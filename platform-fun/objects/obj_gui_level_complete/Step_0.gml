/// @description get clicks

if(saved_alpha_reduce){
	saved_alpha = clamp(saved_alpha-(1/(1*room_speed)), 0, 1);	
}

hovering_menu = (global.device_x >= button_menu_x-button_menu_w/2 &&
global.device_x <= button_menu_x+button_menu_w/2 &&
global.device_y >= button_menu_y-button_menu_h/2 &&
global.device_y <= button_menu_y+button_menu_h/2);

hovering_next = (global.device_x >= button_next_level_x-button_next_level_w/2 &&
global.device_x <= button_next_level_x+button_next_level_w/2 &&
global.device_y >= button_next_level_y-button_next_level_h/2 &&
global.device_y <= button_next_level_y+button_next_level_h/2);

if(global.device_left_pressed){
	if(hovering_menu){
		play_sound(snd_sound_button);
		room_change(rm_menu);
	}
	else if(hovering_next){
		play_sound(snd_sound_button);
		audio_stop_sound(snd_sound_clapping);
		level_next();
		exit;
	}
}