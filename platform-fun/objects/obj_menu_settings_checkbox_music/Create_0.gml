/// @description variables

// Inherit the parent event
event_inherited();

text = "MÚSICA";

performAction = function(){
	global.options_music_on = checked;
	window_set_fullscreen(checked);	
}
