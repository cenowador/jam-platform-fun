function play_music(snd, fade=1000){
	if(snd != asset_get_index(audio_get_name(global.sound_music))){
		if(audio_is_playing(global.sound_music))
			audio_stop_sound(global.sound_music);
			
		global.sound_music = audio_play_sound(snd, 10, true);
		audio_sound_gain(global.sound_music, 0, 0);
		if(global.options_music_enabled){
			audio_sound_gain(global.sound_music, 1, fade);
		}
	}
}

function play_sound(snd, loop=false){
	if(global.options_sound_enabled){
		//play sound
		audio_stop_sound(snd);
		audio_play_sound(snd, 5, loop);	
	}
}