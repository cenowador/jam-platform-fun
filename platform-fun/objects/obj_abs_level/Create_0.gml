/// @description variables

//clown portrait
portrait = {
	normal: 0,
	jumping: 1,
	thinking: 2
}
portrait_index = portrait.normal;

button_play_x = 30;
button_play_y = 250;
button_play_w = sprite_get_width(spr_gui_button_play);
button_play_h = sprite_get_height(spr_gui_button_play);
button_play_hover = false;

button_restart_x = 85;
button_restart_y = 250;
button_restart_w = sprite_get_width(spr_gui_button_play);
button_restart_h = sprite_get_height(spr_gui_button_play);
button_restart_hover = false;

button_menu_x = 60;
button_menu_y = 310;
button_menu_xscale = 2;
button_menu_yscale = 1.5;
button_menu_w = sprite_get_width(spr_gui_button)*button_menu_xscale;
button_menu_h = sprite_get_height(spr_gui_button)*button_menu_yscale;
button_menu_hover = false;

platform_medium_xscale = 4;
platform_medium_yscale = 0.5;
platform_medium_width = sprite_get_width(spr_gui_platform_medium_spawn)*platform_medium_xscale;
platform_medium_height = sprite_get_height(spr_gui_platform_medium_spawn)*platform_medium_yscale;

platform_small_xscale = 2;
platform_small_yscale = 0.5;
platform_small_width = sprite_get_width(spr_gui_platform_medium_spawn)*platform_small_xscale;
platform_small_height = sprite_get_height(spr_gui_platform_medium_spawn)*platform_small_yscale;

anvil_x = 60;
anvil_y = 400;
anvil_w = sprite_get_width(spr_gui_anvil);
anvil_h = sprite_get_height(spr_gui_anvil);
anvil_hover = false;

plat_medium_x = 60;
plat_medium_y = 475;
plat_medium_w = sprite_get_width(spr_gui_platform_medium);
plat_medium_h = sprite_get_height(spr_gui_platform_medium);
plat_medium_hover = false;

plat_small_x = 60;
plat_small_y = 550;
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
spawn_joint_x = 0;
spawn_joint_y = 0;
spawns = {
	anvil: 0,
	plat_medium: 1,
	plat_small: 2
}
spawn_joint_positions = {
	left: 0,
	center: 1,
	right: 2,
	none: 3
}

spawnCalculateJointPosition = function(){
	spawn_joint_x = global.device_x;
	spawn_joint_y = global.device_y;
	var w = 0;
	if(spawning == spawns.plat_medium){
		w = platform_medium_width;
	}
	else if(spawning == spawns.plat_small){
		w = platform_small_width;
	}
	if(spawn_joint_position == spawn_joint_positions.left){
		spawn_joint_x += lengthdir_x(-w/2, spawn_angle);
		spawn_joint_y += lengthdir_y(-w/2, spawn_angle);
	}	
	else if(spawn_joint_position == spawn_joint_positions.right){
		spawn_joint_x += lengthdir_x(w/2, spawn_angle);
		spawn_joint_y += lengthdir_y(w/2, spawn_angle);
	}
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
			image_angle = -phy_rotation;
			if(other.spawn_joint_position != other.spawn_joint_positions.none){
				if(physics_test_overlap(x, y, phy_rotation, obj_platform_wood)){
					spawn_joint_position = other.spawn_joint_position;
					with(instance_create_depth(other.spawn_joint_x, other.spawn_joint_y, depth-1, obj_joint_revolute)){
						parent = other.id;
						if(!weld()){
							instance_destroy();	
						}
					}
				}
			}
		}
	}
	else if(spawning == spawns.plat_small){
		with(instance_create_layer(global.device_x, global.device_y, "Instances", obj_platform_wood_small)){
			phy_rotation = -other.spawn_angle;
			image_angle = -phy_rotation;
			if(other.spawn_joint_position != other.spawn_joint_positions.none){
				if(physics_test_overlap(x, y, phy_rotation, obj_platform_wood)){
					spawn_joint_position = other.spawn_joint_position;
					with(instance_create_depth(other.spawn_joint_x, other.spawn_joint_y, depth-1, obj_joint_revolute)){
						parent = other.id;
						if(!weld()){
							instance_destroy();	
						}
					}
				}
			}
		}
	}
	spawnCancel();
}

confirmMenu = function(){
	
}
