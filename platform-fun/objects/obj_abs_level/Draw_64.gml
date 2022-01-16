/// @description draw interface

var hoverAmt = 0.05;
//draw portrait
draw_sprite_ext(spr_gui_portrait, portrait_index, 90, 88, 4.55, 4.55, 0, c_white, 1);
draw_sprite(spr_gui_overlay, 0, view_wport[0]/2, view_hport[0]/2);
draw_sprite_ext(spr_gui_anvil, 0, anvil_x, anvil_y, 1, 1-hoverAmt*anvil_hover, 0, c_white, 1);
draw_sprite_ext(spr_gui_platform_medium, 0, plat_medium_x, plat_medium_y, 1, 1-hoverAmt*plat_medium_hover, 0, c_white, 1);
draw_sprite_ext(spr_gui_platform_small, 0, plat_small_x, plat_small_y, 1, 1-hoverAmt*plat_small_hover, 0, c_white, 1);


if(spawning != noone){
	//draw spawn radius
	draw_set_color(c_black);
	with(obj_player){
		draw_circle(x, y, other.spawn_radius, true);
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
