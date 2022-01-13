/// @description movement

//check if on ground
var onGround = instance_place(x, y+1, obj_abs_platform);
with(onGround){
	other.physics_movement_impulse = movement_impulse;
	other.phy_angular_damping = angular_damping;
	other.phy_linear_damping = linear_damping;
}
if(onGround == noone){
	physics_movement_impulse = physics_movement_impulse_default;
	phy_linear_damping = physics_linear_damping_default;
	phy_angular_damping = physics_angular_damping_default;
}

//movement
var dir = ((keyboard_check(vk_right) || keyboard_check(ord("D")))-
(keyboard_check(vk_left) || keyboard_check(ord("A"))));
if(dir != 0){
	physics_apply_force(x, y, physics_movement_impulse*dir, 0);
}
else{
	with(onGround){
		stopped();	
	}
}
//jumping
if(onGround != noone && (keyboard_check_pressed(vk_space) ||
keyboard_check_pressed(vk_up) ||
keyboard_check_pressed(ord("W")))){
	physics_apply_force(x, y, 0, -physics_jump_impulse);
}
//clown animation
if(abs(phy_speed_x) >= 0.5){
	var inc = (clown_image_number/room_speed);
	if(dir != 0)
		inc *= dir;
	clown_subimg += inc;
	if(clown_subimg > clown_image_number-1)
		clown_subimg = 0;
	else if(clown_subimg < 0)
		clown_subimg = clown_image_number-1;
}
