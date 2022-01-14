/// @description get clicks

var hoveringMenu = (mouse_x >= button_menu_x-button_menu_w/2 &&
mouse_x <= button_menu_x+button_menu_w/2 &&
mouse_y >= button_menu_y-button_menu_h/2 &&
mouse_y <= button_menu_y+button_menu_h/2);

var hoveringNext = (mouse_x >= button_next_level_x-button_next_level_w/2 &&
mouse_x <= button_next_level_x+button_next_level_w/2 &&
mouse_y >= button_next_level_y-button_next_level_h/2 &&
mouse_y <= button_next_level_y+button_next_level_h/2);

if(global.mouse_left_clicked){
	if(hoveringMenu){
		room_change(rm_menu);
	}
	else if(hoveringNext){
		level_next();
		exit;
	}
}