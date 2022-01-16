/// @description draw interface

//draw interface
var hoverAmt = 0.1;
draw_sprite(spr_gui_overlay, 0, view_wport[0]/2, view_hport[0]/2);
draw_sprite_ext(spr_gui_portrait, portrait_index, 90, 88, 4.55, 4.55, 0, c_white, 1);

if(global.game_paused)
	draw_sprite_ext(spr_gui_button_play, 0, button_play_x, button_play_y, 1.5, 1.5-hoverAmt*button_play_hover, 0, c_white, 1);
else
	draw_sprite_ext(spr_gui_button_pause, 0, button_play_x, button_play_y, 1.5, 1.5-hoverAmt*button_play_hover, 0, c_white, 1);

draw_sprite_ext(spr_gui_button_restart, 0, button_restart_x, button_restart_y, 1.5, 1.5-hoverAmt*button_restart_hover, 0, c_white, 1);

draw_sprite_ext(spr_gui_button, 0, button_menu_x, button_menu_y, button_menu_xscale, button_menu_yscale-hoverAmt*button_menu_hover, 0, c_white, 1);
draw_set_color(c_black);
draw_set_font(fnt_dotty14);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_text(button_menu_x, button_menu_y-5, "MENU");
draw_set_valign(fa_top);

draw_sprite_ext(spr_gui_anvil, 0, anvil_x, anvil_y, 1, 1-hoverAmt*anvil_hover, 0, c_white, 1);
draw_sprite_ext(spr_gui_platform_medium, 0, plat_medium_x, plat_medium_y, 1, 1-hoverAmt*plat_medium_hover, 0, c_white, 1);
draw_sprite_ext(spr_gui_platform_small, 0, plat_small_x, plat_small_y, 1, 1-hoverAmt*plat_small_hover, 0, c_white, 1);


if(spawning != noone){
	//draw spawn radius
	with(obj_player){
		draw_circle(x, y, other.spawn_radius, true);
	}
	
	//don't draw spawns if paused
	if(global.game_paused){
		exit;	
	}
	
	var sx = global.device_x;
	var sy = global.device_y;
	if(spawning == spawns.anvil){
		draw_sprite_ext(spr_gui_anvil_spawn, 0, sx, sy, 0.5, 0.5, spawn_angle, c_white, 0.5);	
	}
	else if(spawning == spawns.plat_medium){
		draw_sprite_ext(spr_gui_platform_medium_spawn, 0,sx, sy, platform_medium_xscale, platform_medium_yscale, spawn_angle, c_white, 0.5);	
	}
	else if(spawning == spawns.plat_small){
		draw_sprite_ext(spr_gui_platform_small_spawn, 0, sx, sy, platform_small_xscale, platform_small_yscale, spawn_angle, c_white, 0.5);
	}
	//cannot spawn
	if(!spawn_device_inside){
		draw_sprite_ext(spr_gui_negate, 0, sx, sy, 1, 1, 0, c_white, 1);	
	}
	//draw joint
	else if(spawn_joint_position != spawn_joint_positions.none){
		draw_sprite_ext(spr_joint_revolute, 0, spawn_joint_x, spawn_joint_y, 1, 1, 0, c_white, 0.5);
	}
}
