/// @description variables

// Inherit the parent event
event_inherited();

text = "TELA CHEIA";
checked = global.options_fullscreen;

performAction = function(){
	global.options_fullscreen = checked;
	window_set_fullscreen(checked);	
}
