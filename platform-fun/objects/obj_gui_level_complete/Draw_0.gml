/// @description Insert description here

//draw bg
draw_self();

//draw game saved text
if(saved_alpha > 0){
	draw_set_font(fnt_dotty22);
	draw_set_color(c_black);
	draw_set_halign(fa_left);
	draw_set_alpha(saved_alpha);
	draw_text(10, view_hport[0]-40, "JOGO SALVO");
	draw_set_alpha(1);
}
	
//draw buttons
draw_sprite_ext(spr_gui_button, 0, button_next_level_x, button_next_level_y, button_next_level_xscale, button_next_level_yscale-0.1*hovering_next, 0, button_next_level_color, 1);
draw_sprite_ext(spr_gui_button, 0, button_menu_x, button_menu_y, button_menu_xscale, button_menu_yscale-0.1*hovering_menu, 0, button_menu_color, 1);
draw_set_color(c_black);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_font(fnt_dotty22);
draw_text(button_next_level_x+5, button_next_level_y, "PRÓXIMO");
draw_text(button_menu_x, button_menu_y, "MENU");
draw_set_valign(fa_top);
	
//draw text
scribble("[wave][fnt_dotty32]["+color_red+"][fa_center]BOM TRABALHO!").draw(x, y-120);
	
//draw critters
with(obj_control){
	if(level_puppy_saved)
		draw_sprite_ext(spr_player_puppy, 0, other.x-102, other.y-14, 2, 2, 0, c_white, 1);
	else
		draw_sprite_ext(spr_player_puppy, 0, other.x-102, other.y-14, 2, 2, 0, c_black, 1);
		
	if(level_panda_saved)
		draw_sprite_ext(spr_player_baby_panda, 0, other.x, other.y-14, 2, 2, 0, c_white, 1);
	else
		draw_sprite_ext(spr_player_baby_panda, 0, other.x, other.y-14, 2, 2, 0, c_black, 1);
			
	if(level_kitten_saved)
		draw_sprite_ext(spr_player_kitten, 0, other.x+96, other.y-14, 2, 2, 0, c_white, 1);
	else
		draw_sprite_ext(spr_player_kitten, 0, other.x+96, other.y-14, 2, 2, 0, c_black, 1);
}
	