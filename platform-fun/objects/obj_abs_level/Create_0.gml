/// @description variables

platform_medium_xscale = 4;
platform_medium_yscale = 0.5;
platform_small_xscale = 2;
platform_small_yscale = 0.5;

anvil_x = 65;
anvil_y = 375;
anvil_w = sprite_get_width(spr_gui_anvil);
anvil_h = sprite_get_height(spr_gui_anvil);

plat_medium_x = 65;
plat_medium_y = 475;
plat_medium_w = sprite_get_width(spr_gui_platform_medium);
plat_medium_h = sprite_get_height(spr_gui_platform_medium);

plat_small_x = 65;
plat_small_y = 575;
plat_small_w = sprite_get_width(spr_gui_platform_small);
plat_small_h = sprite_get_height(spr_gui_platform_small);

//what im spawning
spawning = noone;
spawn_radius = 175;
spawn_angle = 0;
spawn_timer_max = 1;
spawn_timer_current = 0;
spawn_device_inside = false;
spawn_overlapping = noone;
spawns = {
	anvil: 0,
	plat_medium: 1,
	plat_small: 2
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
