/// @description get clicks

if(saved_alpha_reduce){
	saved_alpha = clamp(saved_alpha-(1/(1*room_speed)), 0, 1);	
}

var hoveringMenu = (global.device_x >= button_menu_x-button_menu_w/2 &&
global.device_x <= button_menu_x+button_menu_w/2 &&
global.device_y >= button_menu_y-button_menu_h/2 &&
global.device_y <= button_menu_y+button_menu_h/2);

var hoveringNext = (global.device_x >= button_next_level_x-button_next_level_w/2 &&
global.device_x <= button_next_level_x+button_next_level_w/2 &&
global.device_y >= button_next_level_y-button_next_level_h/2 &&
global.device_y <= button_next_level_y+button_next_level_h/2);

if(global.device_left_pressed){
	if(hoveringMenu){
		room_change(rm_menu);
	}
	else if(hoveringNext){
		level_next();
		exit;
	}
}