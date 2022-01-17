/// @description Insert description here

image_xscale = 16;
image_yscale = 8;

button_next_level_x = x+85;
button_next_level_y = y+80;
button_next_level_xscale = 5;
button_next_level_yscale = 2;
button_next_level_w = sprite_get_width(spr_gui_button)*button_next_level_xscale;
button_next_level_h = sprite_get_height(spr_gui_button)*button_next_level_yscale;
button_next_level_color = make_color_rgb(196, 189, 238);

button_menu_x = x-85;
button_menu_y = button_next_level_y;
button_menu_xscale = 4;
button_menu_yscale = 2;
button_menu_w = sprite_get_width(spr_gui_button)*button_menu_xscale;
button_menu_h = sprite_get_height(spr_gui_button)*button_menu_yscale;
button_menu_color = make_color_rgb(175, 233, 198);

hovering_menu = false;
hovering_next = false;

//game saved text alpha
saved_alpha = 1;
saved_alpha_reduce = false;
alarm[0] = 2*room_speed;

play_sound(snd_sound_clapping);
