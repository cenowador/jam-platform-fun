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
		room_change(rm_menu);
	}
	else if(hovering_next){
		level_next();
		exit;
	}
}