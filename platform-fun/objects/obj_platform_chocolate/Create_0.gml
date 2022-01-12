/// @description Insert description here

// Inherit the parent event
event_inherited();

stopped = function(){
	with(obj_player){
		phy_angular_velocity = 0;
		phy_linear_velocity_x = 0;
		phy_linear_velocity_y = 0;
	}
}