/// @description draw text

// Inherit the parent event
event_inherited();

draw_set_font(fnt_dotty20);
draw_set_color(c_black);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_text(x+5, y, "VOLTAR");
draw_set_valign(fa_top);
