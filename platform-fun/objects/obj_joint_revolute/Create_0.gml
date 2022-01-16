/// @description weld joint

parent = noone;
weld = function(angle_min=0, angle_max=0, angle_limit=true){
	var abort = false;
	if(parent != noone){
		var cols = ds_list_create();
		ds_list_clear(cols);
		var num = instance_place_list(x, y, obj_abs_platform, cols, true);
		if(num >= 2){
			//find parent id
			var pid = ds_list_find_index(cols, parent);
			if(pid > -1){
				//find other platform id
				var nid = pid+1;
				var traversedAll = false;
				while(is_undefined(cols[| nid]) || (!is_undefined(cols[| nid]) && cols[| nid].object_index == obj_prop_popcorn)){
					nid += 1;
					if(nid >= num){
						if(!traversedAll){
							nid = 0;
							traversedAll = true;
						}
						else{
							abort = true;
							break;
						}
					}
				}
				if(!abort){
					physics_joint_revolute_create(cols[| pid], cols[| nid], x, y, angle_min, angle_max, angle_limit, 
					0, 0, false, false);
				}
			}
			else abort = true;
		}
		else abort = true;
		
		ds_list_destroy(cols);
	}
	else abort = true;
	
	return !abort;
}
