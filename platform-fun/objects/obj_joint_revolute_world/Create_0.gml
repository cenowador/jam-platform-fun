/// @description weld joint

parent = noone;
weld = function(angle_min=-365, angle_max=365, angle_limit=false, motor_speed=1000, motor_enable=false){
	if(instance_exists(parent)){
		physics_joint_revolute_create(id, parent, x, y, angle_min, angle_max, angle_limit, 
		1000, motor_speed, motor_enable, false);
	}
}
