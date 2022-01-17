/// @description get interface clicks

button_play_hover = (global.device_x >= button_play_x-button_play_w/2 &&
	global.device_x <= button_play_x+button_play_w/2 &&
	global.device_y >= button_play_y-button_play_h/2 &&
	global.device_y <= button_play_y+button_play_h/2);

//check if paused
if(global.device_left_pressed && button_play_hover){
	global.game_paused = !global.game_paused;
	//toggle physics
	physics_pause_enable(global.game_paused);
}

if(global.game_paused){
	exit;
}
	
button_restart_hover = (global.device_x >= button_restart_x-button_restart_w/2 &&
	global.device_x <= button_restart_x+button_restart_w/2 &&
	global.device_y >= button_restart_y-button_restart_h/2 &&
	global.device_y <= button_restart_y+button_restart_h/2);
	
button_menu_hover = (global.device_x >= button_menu_x-button_menu_w/2 &&
	global.device_x <= button_menu_x+button_menu_w/2 &&
	global.device_y >= button_menu_y-button_menu_h/2 &&
	global.device_y <= button_menu_y+button_menu_h/2);
	
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
	spawnCalculateJointPosition();
	
	//counts spawn time
	if(global.device_left_pressed && spawn_device_inside){ //change to left down to keep timer
		spawn_timer_current += 1;
		if(spawn_timer_current >= spawn_timer_max){
			spawnFinish();
			exit;
		}
	}
	else{
		spawn_timer_current = 0;	
	}
}

//get clicks
if(global.device_left_pressed){
	if(button_menu_hover){
		play_sound(snd_sound_button);
		confirmMenu();
	}
	else if(button_restart_hover){
		play_sound(snd_sound_button);
		level_failed();
	}
	else if(anvil_hover){
		play_sound(snd_sound_button);
		spawnAnvil();
	}
	else if(plat_medium_hover){
		play_sound(snd_sound_button);
		spawnPlatMedium();
	}
	else if(plat_small_hover){
		play_sound(snd_sound_button);
		spawnPlatSmall();
	}
}
