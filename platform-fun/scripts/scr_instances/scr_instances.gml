///@function deactivate_instances_exceptions(excepts[])
///@desc deactivates everyone, except caller and exceptions; return an array of deactivated instances
function deactivate_instances_exceptions(excepts){
	var deactivated = [];
	excepts = array_copy_structs(excepts);
	array_push(excepts, id);
		
	with(all){
		if(!array_contains(excepts, id) && !array_contains(excepts, object_index) &&
		!array_contains(excepts, object_get_parent(object_index))){
			array_push(deactivated, id);
			instance_deactivate_object(id);
		}
	}

	return deactivated;
}

///@function activate_instances_selected(selected[])
///@desc reactivates the selected instances
function activate_instances_selected(selected){
	var selected_amt = array_length(selected);
	for(var j = 0; j < selected_amt; ++j){
		instance_activate_object(selected[j]);
	}
}

///@desc deactivates all but some instances and layers
function modal_deactivation(excepts){
	var deac_inst = deactivate_instances_exceptions(excepts);
	var deac_layer = layer_deactivate_all(excepts);
	
	return {deactivated_instances: deac_inst,
		deactivated_layers: deac_layer};
}

///@function modal_reactivation(instances[], layers[])
///@desc reactivates instances and layers
function modal_reactivation(insts, lays){
	activate_instances_selected(insts);
	layer_activate_selected(lays);
}
