/// @description movement

var dir = ((keyboard_check(vk_right) || keyboard_check(ord("D")))-
(keyboard_check(vk_left) || keyboard_check(ord("A"))));
if(dir != 0){
	physics_apply_force(x, y, physics_movement_impulse*dir, 0);
}

var onGround = instance_place(x, y+1, obj_abs_platform);
with(onGround){
	other.phy_angular_damping = angular_damping;
	other.phy_linear_damping = linear_damping;
}

if(onGround != noone && (keyboard_check_pressed(vk_space) ||
keyboard_check_pressed(vk_up) ||
keyboard_check_pressed(ord("W")))){
	physics_apply_force(x, y, 0, -physics_jump_impulse);
}

show_debug_message(phy_angular_velocity)