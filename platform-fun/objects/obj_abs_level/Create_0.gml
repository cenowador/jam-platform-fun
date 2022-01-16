/// @description variables

platform_medium_xscale = 4;
platform_medium_yscale = 0.5;
platform_medium_width = sprite_get_width(spr_gui_platform_medium_spawn)*platform_medium_xscale;
platform_medium_height = sprite_get_height(spr_gui_platform_medium_spawn)*platform_medium_yscale;

platform_small_xscale = 2;
platform_small_yscale = 0.5;

anvil_x = 60;
anvil_y = 375;
anvil_w = sprite_get_width(spr_gui_anvil);
anvil_h = sprite_get_height(spr_gui_anvil);
anvil_hover = false;

plat_medium_x = 60;
plat_medium_y = 475;
plat_medium_w = sprite_get_width(spr_gui_platform_medium);
plat_medium_h = sprite_get_height(spr_gui_platform_medium);
plat_medium_hover = false;

plat_small_x = 60;
plat_small_y = 575;
plat_small_w = sprite_get_width(spr_gui_platform_small);
plat_small_h = sprite_get_height(spr_gui_platform_small);
plat_small_hover = false;

//what im spawning
spawning = noone;
spawn_radius = 175;
spawn_angle = 0;
spawn_timer_max = 1;
spawn_timer_current = 0;
spawn_device_inside = false;
spawn_joint_position = 0;
spawns = {
	anvil: 0,
	plat_medium: 1,
	plat_small: 2
}
spawn_joint_positions = {
	left: 0,
	right: 1,
	none: 2
}

spawnAnvil = function(){
	spawning = spawns.anvil;
}

spawnPlatMedium = function(){
	spawning = spawns.plat_medium;
}

spawnPlatSmall = function(){
	spawning = spawns.plat_small;
}

spawnCancel = function(){
	spawning = noone;
	spawn_angle = 0;
	spawn_timer_current = 0;
}

spawnFinish = function(){
	if(spawning == spawns.anvil){
		with(instance_create_layer(global.device_x, global.device_y, "Instances", obj_prop_anvil)){
			phy_rotation = -other.spawn_angle;
		}
	}
	else if(spawning == spawns.plat_medium){
		with(instance_create_layer(global.device_x, global.device_y, "Instances", obj_platform_wood_medium)){
			phy_rotation = -other.spawn_angle;
		}
	}
	else if(spawning == spawns.plat_small){
		with(instance_create_layer(global.device_x, global.device_y, "Instances", obj_platform_wood_small)){
			phy_rotation = -other.spawn_angle;
		}
	}
	spawnCancel();
}
