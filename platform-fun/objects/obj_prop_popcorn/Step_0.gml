/// @description Insert description here

// Inherit the parent event
event_inherited();

//check if out of screen
if(x > room_width+100 || x < -100 || y > room_height+100 || y < -100){
	instance_destroy();
	exit;
}
