/// @description variables

// Inherit the parent event
event_inherited();

text = "MÚSICA";
checked = global.options_music_enabled;

performAction = function(){
	global.options_music_enabled = !global.options_music_enabled;
	if(!global.options_music_enabled)
		audio_pause_sound(global.sound_music);
	else{
		audio_resume_sound(global.sound_music);
		audio_sound_gain(global.sound_music, 1, 1000);
	}
}
