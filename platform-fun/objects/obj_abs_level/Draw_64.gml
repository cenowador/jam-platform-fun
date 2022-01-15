/// @description draw interface

draw_sprite(spr_gui_overlay, 0, view_wport[0]/2, view_hport[0]/2);
draw_sprite(spr_gui_anvil, 0, anvil_x, anvil_y);
draw_sprite(spr_gui_platform_medium, 0, plat_medium_x, plat_medium_y);
draw_sprite(spr_gui_platform_small, 0, plat_small_x, plat_small_y);

if(spawning != noone){
	//draw spawn radius
	draw_set_color(c_black);
	with(obj_player){
		draw_circle(x, y, other.spawn_radius, true);
	}
	if(spawning == spawns.anvil){
		draw_sprite_ext(spr_gui_anvil_spawn, 0, global.device_x, global.device_y, 0.5, 0.5, spawn_angle, c_white, 1);	
	}
	else if(spawning == spawns.plat_medium){
		draw_sprite_ext(spr_gui_platform_medium_spawn, 0, global.device_x, global.device_y, platform_medium_xscale, platform_medium_yscale, spawn_angle, c_white, 1);	
	}
	else if(spawning == spawns.plat_small){
		draw_sprite_ext(spr_gui_platform_small_spawn, 0, global.device_x, global.device_y, platform_small_xscale, platform_small_yscale, spawn_angle, c_white, 1);
	}
	//cannot spawn
	if(!device_inside_spawn){
		
	}
}
