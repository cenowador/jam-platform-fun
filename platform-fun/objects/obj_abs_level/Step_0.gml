/// @description get interface clicks

var anvilHover = (global.device_x >= anvil_x-anvil_w/2 &&
	global.device_x <= anvil_x+anvil_w/2 &&
	global.device_y >= anvil_y-anvil_h/2 &&
	global.device_y <= anvil_y+anvil_h/2);
var platMedHover = (global.device_x >= plat_medium_x-plat_medium_w/2 &&
	global.device_x <= plat_medium_x+plat_medium_w/2 &&
	global.device_y >= plat_medium_y-plat_medium_h/2 &&
	global.device_y <= plat_medium_y+plat_medium_h/2);
var platSmallHover = (global.device_x >= plat_small_x-plat_small_w/2 &&
	global.device_x <= plat_small_x+plat_small_w/2 &&
	global.device_y >= plat_small_y-plat_small_h/2 &&
	global.device_y <= plat_small_y+plat_small_h/2);
	
//get spawn rotation
if(spawning != noone){
	//counts spawn time
	with(obj_player){
		other.device_inside_spawn = point_in_circle(global.device_x, global.device_y, x, y, other.spawn_radius);
	}
	if(global.device_left_down && device_inside_spawn){
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
			clickedSame = (clickedSame && anvilHover);
		}
		else if(spawning == spawns.plat_medium){
			clickedSame = (clickedSame && platMedHover);
		}
		else if(spawning == spawns.plat_small){
			clickedSame = (clickedSame && platSmallHover);
		}
		
		if(clickedSame || mouse_check_button_pressed(mb_right) || keyboard_check_pressed(vk_escape)){
			spawnCancel();
			exit;
		}
	}
}

//get clicks
if(global.device_left_pressed){
	if(anvilHover)
		spawnAnvil();
	else if(platMedHover)
		spawnPlatMedium();
	else if(platSmallHover)
		spawnPlatSmall();
}
