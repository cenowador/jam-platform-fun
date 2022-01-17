/// @description variables

// Inherit the parent event
event_inherited();

text = "SONS";
checked = global.options_sound_enabled;

performAction = function(){
	global.options_sound_enabled = checked;
}
