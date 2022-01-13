/// @description weld joint

//must weld them on creation code
welded = false;
weld_targets = [];
weld = function(target_1, target_2, dist=300){
	if(target_1 != noone && target_2 != noone){
		welded = true;
		array_push(weld_targets, target_1, target_2);
		physics_joint_rope_create(target_1, target_2, x, y, 
		target_2.x, target_2.y, dist, true);
	}
}
