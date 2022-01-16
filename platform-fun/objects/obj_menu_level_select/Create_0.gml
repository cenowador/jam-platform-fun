/// @description variables

image_xscale = 18.75;
image_yscale = 14.06;

level_amount_w = 5;
level_amount_h = 4;

level_button_w = sprite_get_width(spr_menu_level_select_select_button);
level_button_h = sprite_get_height(spr_menu_level_select_select_button);
level_button_x = x-sprite_width/2+level_button_w/2+20;
level_button_y = y-sprite_height/2+level_button_h/2+30;
level_button_margin_w = 20;
level_button_margin_h = 20;

level_open = 0;
level_open_x = 200;
level_open_y = y;
level_open_xscale = 8;
level_open_yscale = 10;
level_open_button_play_x = level_open_x;
level_open_button_play_y = level_open_y+70;
level_open_button_play_w = sprite_get_width(spr_gui_button)*2;
level_open_button_play_h = sprite_get_height(spr_gui_button);
level_open_puppy_x = level_open_x-45;
level_open_puppy_y = level_open_y-70;
level_open_panda_x = level_open_x+5;
level_open_panda_y = level_open_y-70;
level_open_kitten_x = level_open_x+45;
level_open_kitten_y = level_open_y-70;
level_open_button_play_x = level_open_x;
level_open_button_play_y = level_open_y+120;
level_open_button_play_w = sprite_get_width(spr_gui_button_play);
level_open_button_play_h = sprite_get_height(spr_gui_button_play);
level_open_button_play_hover = false;

playLevel = function(idx){
	with(obj_control){
		level_reset_stats();
		var rm_id = asset_get_index("rm_level_"+string(idx));
		if(room_exists(rm_id))
			room_change(rm_id);
	}
}

openLevel = function(idx){
	level_open = idx;
}
