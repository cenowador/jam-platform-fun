/// @description keep speed

if(array_length(weld_targets) >= 2){
	var t2 = weld_targets[1];
	physics_apply_impulse(t2.x, t2.y, 100*sign(phy_linear_velocity_x), 0);
}
