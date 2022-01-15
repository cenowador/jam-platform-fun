/// @description get mouse click

global.device_left_pressed = mouse_check_button_pressed(mb_left);
global.device_left_down = mouse_check_button(mb_left);
global.device_x = device_mouse_x_to_gui(0);
global.device_y = device_mouse_y_to_gui(0);
