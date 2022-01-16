/// @description Insert description here

parent = noone;
weld = function(angle_min=0, angle_max=0, angle_limit=true){
	if(parent != noone){
		physics_joint_prismatic_create(id, parent, x, y, 0, 0, 0, 0, false, 0, 0, false, false);
	}
}
