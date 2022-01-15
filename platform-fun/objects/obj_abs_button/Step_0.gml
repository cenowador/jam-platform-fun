/// @description get clicks

var hoveringMe = (global.device_x >= x-sprite_width/2 &&
global.device_x <= x+sprite_width/2 &&
global.device_y >= y-sprite_height/2 &&
global.device_y <= y+sprite_height/2);

if(hoveringMe){
	if(global.device_left_pressed){
		clickedMe();	
	}
}
