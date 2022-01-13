/// @description weld joint

weld = function(angle_min=0, angle_max=0, angle_limit=false){
	var below = instance_place(x, y, obj_abs_platform);
	if(instance_exists(below)){
		physics_joint_revolute_create(below, id, x, y, angle_min, angle_max, angle_limit, 
		0, 0, false, false);	
	}
}
