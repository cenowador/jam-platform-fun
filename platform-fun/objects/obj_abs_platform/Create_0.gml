/// @description variables

//ingerit parent
event_inherited();

self_moving_x = false;
self_moving_x_max_dist = 100;
self_moving_x_speed = 2;
self_moving_x_right = true;

self_moving_y = false;
self_moving_y_max_dist = 100;
self_moving_y_speed = 2;
self_moving_y_down = true;

spawn_joint_positions = {
	left: 0,
	center: 1,
	right: 2,
	none: 3
}

spawn_joint_position = spawn_joint_positions.none;

spawnCalculateJointPosition = function(){
	var spawn_joint_x = x;
	var spawn_joint_y = y;
	if(spawn_joint_position == spawn_joint_positions.left){
		spawn_joint_x += lengthdir_x(-sprite_width/2, image_angle);
		spawn_joint_y += lengthdir_y(-sprite_width/2, image_angle);
	}	
	else if(spawn_joint_position == spawn_joint_positions.right){
		spawn_joint_x += lengthdir_x(sprite_width/2, image_angle);
		spawn_joint_y += lengthdir_y(sprite_width/2, image_angle);
	}
	return {xp: spawn_joint_x, yp: spawn_joint_y};
}
