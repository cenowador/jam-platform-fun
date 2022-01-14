///@function array_contains(arr, item)
function array_contains(arr, item){
	var exists = false;
	if(is_array(arr)){
		var arrLeng = array_length(arr);
		for(var i = arrLeng-1; i >= 0; --i){
			if(arr[i] == item){
				exists = true;
				break;
			}
		}
	}
	return exists;
}

///@function array_convert_structs(arr)
///@desc checks if array contains structs and converts them to arrays
function array_convert_structs(arr){
	var finalArr = [];
	var size = array_length(arr);
	for(var i = 0; i < size; ++i){
		var current = arr[i];
		if(is_struct(current)){
			array_push(finalArr, "isStruct");
			current = struct_to_array(current);
		}
		else if(is_array(current)){
			array_push(finalArr, "isArray");
			current = array_convert_structs(current);
		}
		array_push(finalArr, current);
	}
	
	return finalArr;
}

///@function array_copy_structs(arr)
///@desc copies array content to another array, copying structs to new structs
function array_copy_structs(arr){
	var newArr = [];
	var size = array_length(arr);
	for(var i = 0; i < size; ++i){
		var value = arr[i];
		if(is_struct(value))
			value = struct_copy(value);
		else if(is_array(value))
			value = array_copy_structs(value);
			
		array_push(newArr, value);	
	}
	return newArr;
}

///@function struct_copy(struct)
///@desc copies content from one struct to another
function struct_copy(original_struct){
	var newStruct = {};
	var names = variable_struct_get_names(original_struct);
	var names_amt = array_length(names);
	for(var i = 0; i < names_amt; ++i){
		var current = variable_struct_get(original_struct, names[i]);
		var finalValue = current;
		if(is_array(current))
			finalValue = array_copy_structs(current);
		else if(is_struct(current))
			finalValue = struct_copy(current);
			
		variable_struct_set(newStruct, names[i], finalValue);
	}
	return newStruct;
}

///@function struct_to_array(struct)
///@desc transforms struct into an array of [key1, val1, key2, val2...]
function struct_to_array(original_struct){
	var finalArr = [];
	var structNames = variable_struct_get_names(original_struct);
	array_sort(structNames, true); //sorts array to keep struct order in every platform
	var structSize = array_length(structNames);
	for(var i = 0; i < structSize; ++i){
		var currentName = structNames[i];
		var currentValue = variable_struct_get(original_struct, currentName);
		if(is_struct(currentValue)){
			currentName = string_insert("isStruct", currentName, 1);
			currentValue = struct_to_array(currentValue);
		}
		else if(is_array(currentValue)){
			currentName = string_insert("isArray", currentName, 1);
			currentValue = array_convert_structs(currentValue);
		}

		array_push(finalArr, currentName);
		array_push(finalArr, currentValue);
	}

	return finalArr;
}

///@function array_to_struct(arr, finalStruct)
///@desc converts an array to equivalent struct
function array_to_struct(original_array, finalStruct){
	
	//converts the inner structs of an array
	function array_convert_inner_structs(original_array){
		var finalArr = [];
		var size = array_length(original_array);
		for(var i = 0; i < size; ++i){
			var currentValue = original_array[i];
			if(is_string(currentValue)){
				if(string_pos("isArray", currentValue) == 1){
					//if is array
					currentValue = string_replace(currentValue, "isArray", "");
					i += 1; //advances iteration
					var newArr = original_array[i];
					currentValue = array_convert_inner_structs(newArr);
				}
				else if(string_pos("isStruct", currentValue) == 1){
					//if is an struct
					currentValue = string_replace(currentValue, "isStruct", "");
					i += 1; //advances iteration
					var newStruct = {};
					array_to_struct(original_array[i], newStruct);
					//variable_struct_set(newStruct, currentValue, newStruct);
					currentValue = newStruct;
				}
			}
			else if(is_array(currentValue)){
				currentValue = array_convert_inner_structs(currentValue);
			}
			array_push(finalArr, currentValue);
		}
	
		return finalArr;
	}
	
	var size = array_length(original_array);
	var lastIdentifier = "";
	for(var i = 0; i < size; ++i){
		var currentValue = original_array[i];
		if(is_string(currentValue) && lastIdentifier == ""){
			//if is an identifier
			if(string_pos("isArray", currentValue) == 1){
				//if is array
				currentValue = string_replace(currentValue, "isArray", "");
				i += 1; //advances iteration
				var newArr = original_array[i];
				newArr = array_convert_inner_structs(newArr);
				variable_struct_set(finalStruct, currentValue, newArr);
			}
			else if(string_pos("isStruct", currentValue) == 1){
				//if is an struct
				currentValue = string_replace(currentValue, "isStruct", "");
				i += 1; //advances iteration
				var newStruct = {};
				newStruct = array_to_struct(original_array[i], newStruct);
				variable_struct_set(finalStruct, currentValue, newStruct);
			}
			else
				lastIdentifier = currentValue;
		}
		else{
			variable_struct_set(finalStruct, lastIdentifier, currentValue);
			lastIdentifier = "";
		}
	}

	return finalStruct;
}
