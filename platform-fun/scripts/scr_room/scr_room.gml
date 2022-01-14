function room_change(rm, animate=true){
	if(!animate)
		room_goto(rm);
	else
		room_transition(rm, tt_wipe_out_horizontal);
}

///@function layer_activate_selected(selection)
///@desc makes selected layers visible
function layer_activate_selected(selection){
	var lay_amt = array_length(selection);
	for(var i = 0; i < lay_amt; ++i){
		layer_set_visible(selection[i], true);
	}
}

///@function layer_deactivate_all(excepts[])
///@desc makes all layers invisible, except some (instance based)
function layer_deactivate_all(excepts){
	var deactivated = [];
	var layers = layer_get_all();
	var lay_amt = array_length(layers);
	for(var i = 0; i < lay_amt; ++i){
		if(layer_get_visible(layers[i])){
			if(string_count("background", string_lower(layer_get_name(layers[i]))) <= 0){
				var contains = false;
				var except_size = array_length(excepts);
				for(var j = 0; j < except_size; ++j){
					if(layer_has_instance(layers[i], excepts[j])){
						contains = true;
						break;
					}
				}
				if(!contains){
					layer_set_visible(layers[i], false); //if got here, no exceptions are in the layer
					array_push(deactivated, layers[i]);
				}
			}
		}
	}
	
	return deactivated;
}