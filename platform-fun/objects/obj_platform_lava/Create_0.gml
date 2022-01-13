/// @description Insert description here

// Inherit the parent event
event_inherited();

onCollisionWithPlayer = function(){
	with(obj_player){
		phy_position_y -= 200;	
	}
}
