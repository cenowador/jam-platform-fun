/// @description get clicks

if(global.game_paused)
	exit;
	
hovering_me = (global.device_x >= x-sprite_width/2 &&
global.device_x <= x+sprite_width/2 &&
global.device_y >= y-sprite_height/2 &&
global.device_y <= y+sprite_height/2);

if(hovering_me){
	if(global.device_left_pressed){
		clickedMe();	
	}
}
