/// @description check if out of screen

if(x > room_width+500 || x < -500 || y > room_height+500 || y < -500){
	instance_destroy();
}
