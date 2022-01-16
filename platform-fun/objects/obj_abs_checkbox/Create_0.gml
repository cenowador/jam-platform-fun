/// @description variables

checked = false;
text = "";

performAction = function(){}

clicked = function(){
	checked = !checked;
	image_index = checked;
	performAction();
}
