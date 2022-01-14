/// @description Insert description here

//draw bg
draw_self();
	
//draw buttons
draw_sprite(spr_gui_level_complete_next, 0, button_next_level_x, button_next_level_y);
draw_sprite(spr_gui_level_complete_menu, 0, button_menu_x, button_menu_y);
	
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
	