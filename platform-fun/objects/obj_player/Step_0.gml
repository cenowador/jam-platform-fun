/// @description movement

if(global.game_paused)
	exit;

//check if out of screen
if(x > room_width+300 || x < -300 || y > room_height+300 || y < -300){
	level_failed();
	exit;
}

//change portrait
with(obj_abs_level){
	portrait_index = portrait.normal;
}

//check if on ground
var onGround = instance_place(x, y+1, obj_abs_solid);
with(onGround){
	other.physics_movement_impulse = movement_impulse;
	other.phy_angular_damping = angular_damping;
	other.phy_linear_damping = linear_damping;
}
if(onGround == noone){
	physics_movement_impulse = physics_movement_impulse_default;
	phy_linear_damping = physics_linear_damping_default;
	phy_angular_damping = physics_angular_damping_default;
	//change portrait
	out_of_ground_timer += 1;
	if(out_of_ground_timer >= out_of_ground_timer_thresh){
		with(obj_abs_level){
			portrait_index = portrait.jumping;
		}
	}
}
else{
	out_of_ground_timer = 0;	
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

//check if spawning something
var spawn = false;
with(obj_abs_level){
	spawn = (spawning != noone);
}

//only jump if not spawning
if(!spawn){
	//jumping
	if(onGround != noone && (keyboard_check_pressed(vk_space) ||
	keyboard_check_pressed(vk_up) ||
	keyboard_check_pressed(ord("W")))){
		physics_apply_force(x, y, 0, -physics_jump_impulse);
	}
}
else{
	//change portrait
	with(obj_abs_level){
		portrait_index = portrait.thinking;
	}	
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
