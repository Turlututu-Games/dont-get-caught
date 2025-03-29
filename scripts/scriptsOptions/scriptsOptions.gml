function readOptionsConfig() {
	
	if(STEAM && global.steamIsReady) {
		if steam_file_exists(SAVE_STEAM)
		{
			
			show_debug_message("Read options from Steam Cloud");
			
		    save_str = steam_file_read(SAVE_STEAM);
			
			ini_open_from_string(save_str);
			var _musicOption = ini_read_real("options", "music", 1);
			var _soundOption = ini_read_real("options", "sound", 1);
			var _fullscreenOption = ini_read_real("options", "fullscreen", window_get_fullscreen());
			var _systemLanguagenOption = ini_read_string("options", "language", getLanguageIdentifier(os_get_language()));

			ini_close();
			
			return {
				musicOption: _musicOption,
				soundOption: _soundOption,
				fullscreenOption: _fullscreenOption,
				systemLanguagenOption: _systemLanguagenOption
			}
		}
	}	
	
	show_debug_message("Read options from local file");
	
	ini_open(SAVE);
	var _musicOption = ini_read_real("options", "music", 1);
	var _soundOption = ini_read_real("options", "sound", 1);
	var _fullscreenOption = ini_read_real("options", "fullscreen", window_get_fullscreen());
	var _systemLanguagenOption = ini_read_string("options", "language", getLanguageIdentifier(os_get_language()));

	ini_close();
	
	return {
		musicOption: _musicOption,
		soundOption: _soundOption,
		fullscreenOption: _fullscreenOption,
		systemLanguagenOption: _systemLanguagenOption
	}
	

}

function writeOptionsConfig() {
	
	show_debug_message("Write options to local file");
	
		ini_open(SAVE);
		ini_write_real("options", "music", global.gameOptions.music);
		ini_write_real("options", "sound", global.gameOptions.sound);
		ini_write_real("options", "fullscreen", global.gameOptions.fullscreen);	
		ini_write_string("options", "language", global.gameOptions.language);
		ini_close();
	
	if(STEAM && global.steamIsReady) {
		show_debug_message("Read options to Steam Cloud");
		steam_file_write_file(SAVE_STEAM, SAVE);
	}
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