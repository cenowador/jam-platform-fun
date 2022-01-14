/// @description get clicks

var hoveringMe = (mouse_x >= x-sprite_width/2 &&
mouse_x <= x+sprite_width/2 &&
mouse_y >= y-sprite_height/2 &&
mouse_y <= y+sprite_height/2);

if(hoveringMe){
	if(global.mouse_left_clicked){
		clickedMe();	
	}
}
