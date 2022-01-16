/// @description draw level buttons

//draw_self();

//draw level menu
draw_set_font(fnt_dotty32);
draw_set_color(c_black);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
var it = 0;
for(var i = 0; i < level_amount_h; ++i){
	for(var j = 0; j < level_amount_w; ++j){
		it += 1;
		var bx = level_button_x+(level_button_margin_w+level_button_w)*j;
		var by = level_button_y+(level_button_margin_h+level_button_h)*i;
		with(obj_control){
			draw_sprite(spr_menu_level_select_select_button, 0, bx, by);
			draw_text(bx, by, it);
			if(level_current < it){
				draw_sprite_ext(spr_gui_negate, 1, bx, by, 2, 2, 0, c_white, 1);
			}
		}
	}
}
draw_set_valign(fa_top);

//draw current level stats
if(level_open > 0){
	draw_sprite_ext(spr_gui_button, 0, level_open_x, level_open_y, level_open_xscale, level_open_yscale, 0, c_white, 1);
	//draw header
	draw_set_color(c_black);
	draw_set_font(fnt_dotty22);
	draw_set_halign(fa_center);
	draw_text(level_open_x, level_open_y-150, "LEVEL "+string(level_open));
	
	var stats = {
		puppy: false,
		kitten: false,
		panda: false,
		time: 0,
		failures: 0
	}
	//draw critters
	with(obj_control){
		var level = string(other.level_open);
		if(!is_undefined(levels_stats[? level]))
			stats = levels_stats[? level];
	}
	if(stats.puppy)
		draw_sprite_ext(spr_player_puppy, 0, level_open_puppy_x, level_open_puppy_y, 2, 2, 0, c_white, 1);
	else
		draw_sprite_ext(spr_player_puppy, 0, level_open_puppy_x, level_open_puppy_y, 2, 2, 0, c_black, 1);
			
	if(stats.panda)
		draw_sprite_ext(spr_player_kitten, 0, level_open_kitten_x, level_open_kitten_y, 2, 2, 0, c_white, 1);
	else
		draw_sprite_ext(spr_player_kitten, 0, level_open_kitten_x, level_open_kitten_y, 2, 2, 0, c_black, 1);
		
	if(stats.kitten)
		draw_sprite_ext(spr_player_baby_panda, 0, level_open_panda_x, level_open_panda_y, 2, 2, 0, c_white, 1);
	else
		draw_sprite_ext(spr_player_baby_panda, 0, level_open_panda_x, level_open_panda_y, 2, 2, 0, c_black, 1);

	//draw failures
	draw_set_font(fnt_dotty14);
	draw_text(level_open_x, level_open_y-35, "FALHAS\n");
	draw_text(level_open_x, level_open_y+30, "TEMPO\n");
	draw_set_font(fnt_dotty22);
	draw_set_color(color_red_rgb);
	draw_text(level_open_x, level_open_y-15, string(stats.failures));
	
	//draw time
	var seconds = floor(stats.time/room_speed);
	var minutes = floor(seconds/60);
	var sseconds = string(seconds);
	var sminutes = string(minutes);
	if(seconds < 10)
		sseconds = "0"+sseconds;
	var final = sminutes+"m "+sseconds+"s";
	draw_text(level_open_x, level_open_y+50, final);
	
	//draw play button
	draw_sprite_ext(spr_gui_button_play, 0, level_open_button_play_x, level_open_button_play_y, 1.75, 1.75-0.05*level_open_button_play_hover, 0, c_white, 1);
}
