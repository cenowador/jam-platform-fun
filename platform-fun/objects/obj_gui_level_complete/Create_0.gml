/// @description Insert description here

image_xscale = 16;
image_yscale = 8;

button_next_level_x = x+75;
button_next_level_y = y+80;
button_next_level_w = sprite_get_width(spr_gui_level_complete_next);
button_next_level_h = sprite_get_height(spr_gui_level_complete_next);

button_menu_x = x-75;
button_menu_y = button_next_level_y;
button_menu_w = sprite_get_width(spr_gui_level_complete_menu);
button_menu_h = sprite_get_height(spr_gui_level_complete_menu);

//game saved text alpha
saved_alpha = 1;
saved_alpha_reduce = false;
alarm[0] = 2*room_speed;
