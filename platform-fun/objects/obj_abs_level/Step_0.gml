/// @description get interface clicks

anvil_hover = (global.device_x >= anvil_x-anvil_w/2 &&
	global.device_x <= anvil_x+anvil_w/2 &&
	global.device_y >= anvil_y-anvil_h/2 &&
	global.device_y <= anvil_y+anvil_h/2);
plat_medium_hover = (global.device_x >= plat_medium_x-plat_medium_w/2 &&
	global.device_x <= plat_medium_x+plat_medium_w/2 &&
	global.device_y >= plat_medium_y-plat_medium_h/2 &&
	global.device_y <= plat_medium_y+plat_medium_h/2);
plat_small_hover = (global.device_x >= plat_small_x-plat_small_w/2 &&
	global.device_x <= plat_small_x+plat_small_w/2 &&
	global.device_y >= plat_small_y-plat_small_h/2 &&
	global.device_y <= plat_small_y+plat_small_h/2);
	
//get spawn rotation
if(spawning != noone){
	//get if inside spawn radius
	with(obj_player){
		other.spawn_device_inside = point_in_circle(global.device_x, global.device_y, x, y, other.spawn_radius);
	}
	
	//get if changing joint
	if(keyboard_check_pressed(ord("J"))){
		spawn_joint_position += 1;
		if(spawn_joint_position > spawn_joint_positions.none)
			spawn_joint_position = spawn_joint_positions.left;
	}
	
	//counts spawn time
	if(global.device_left_down && spawn_device_inside){
		spawn_timer_current += 1;
		if(spawn_timer_current >= spawn_timer_max){
			spawnFinish();
			exit;
		}
	}
	else{
		spawn_timer_current = 0;	
	}
	
	if(mouse_wheel_up() || keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))){
		spawn_angle += 15;	
	}
	else if(mouse_wheel_down() || keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))){
		spawn_angle -= 15;	
	}
	//check if cancelling
	else{
		var clickedSame = global.device_left_pressed;
		if(spawning == spawns.anvil){
			clickedSame = (clickedSame && anvil_hover);
		}
		else if(spawning == spawns.plat_medium){
			clickedSame = (clickedSame && plat_medium_hover);
		}
		else if(spawning == spawns.plat_small){
			clickedSame = (clickedSame && plat_small_hover);
		}
		
		if(clickedSame || mouse_check_button_pressed(mb_right) || keyboard_check_pressed(vk_escape)){
			spawnCancel();
			exit;
		}
	}
}

//get clicks
if(global.device_left_pressed){
	if(anvil_hover)
		spawnAnvil();
	else if(plat_medium_hover)
		spawnPlatMedium();
	else if(plat_small_hover)
		spawnPlatSmall();
}
