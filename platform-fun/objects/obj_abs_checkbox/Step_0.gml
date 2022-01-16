/// @description get clicks

if(global.device_left_pressed){
	if(point_in_rectangle(global.device_x, global.device_y, bbox_left, bbox_top,
	bbox_right, bbox_bottom)){
		clicked();
	}
}
