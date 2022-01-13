/// @description weld joint

var below = instance_place(x, y, obj_abs_platform);
if(instance_exists(below)){
	physics_joint_revolute_create(below, id, x, y, 0, 0, false, 0, 0, false, false);	
}
