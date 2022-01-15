/// @description draw level buttons

draw_self();

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
