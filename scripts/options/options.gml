function writeOptionsConfig() {
	ini_open(SAVE);
	ini_write_real("options", "music", global.gameOptions.music);
	ini_write_real("options", "sound", global.gameOptions.sound);
	ini_write_real("options", "fullscreen", global.gameOptions.fullscreen);	
	ini_write_string("options", "language", global.gameOptions.language);
	ini_close();
}

function toggleOptionFullScreen() {
	global.gameOptions.fullscreen = !global.gameOptions.fullscreen;
	window_set_fullscreen(global.gameOptions.fullscreen);
	writeOptionsConfig();
}

function toggleOptionLanguage() {
	// Dirty, but good enough for the moment
	
	if(global.gameOptions.language == "en") {
		global.gameOptions.language = "fr";	
	} else {
		global.gameOptions.language = "en";
	}
	
	setLanguage(global.gameOptions.language);
	writeOptionsConfig();
}

function toggleOptionSound() {
	global.gameOptions.sound++;
	if(global.gameOptions.sound > 2) {
		global.gameOptions.sound = 0;	
	}
	writeOptionsConfig();
}

function toggleOptionMusic() {
	global.gameOptions.music++;
	if(global.gameOptions.music > 2) {
		global.gameOptions.music = 0;	
	}
	
	if(global.music.playing != undefined) {
		var _music = global.music.playing;
		global.music.playing = undefined;
		var _position = audio_sound_get_track_position(global.music.id);
		audio_stop_sound(_music);
		playMusic(_music, global.music.intensity);
		audio_sound_set_track_position(global.music.id, _position);
	}
	
	writeOptionsConfig();
}