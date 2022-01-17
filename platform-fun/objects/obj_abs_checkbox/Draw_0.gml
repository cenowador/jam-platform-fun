/// @description draw text

draw_sprite(sprite_index, checked, x, y);

//draw text
draw_set_font(fnt_dotty22);
draw_set_color(c_black);
draw_set_halign(fa_left);
draw_set_valign(fa_center);
draw_text(x+sprite_width/2+20, y, text);
draw_set_valign(fa_top);
