randomize();

global.music = {
	playing: undefined,
	intensity: 1,
	id: -1
};

global.platform = Platforms.BROWSER;
global.exiting = false;
global.mouseCursor = false;
cursorDisplayed = false;

global.debugVariables = [];

global.inputs = getInputs();

cooldownCommand = 0;

ini_open(SAVE);
var _musicOption = ini_read_real("options", "music", 1);
var _soundOption = ini_read_real("options", "sound", 1);
var _fullscreenOption = ini_read_real("options", "fullscreen", window_get_fullscreen());
var _systemLanguagenOption = ini_read_string("options", "language", getLanguageIdentifier(os_get_language()));

ini_close();

global.language = {};

var _bufferLanguage    = buffer_load( working_directory + "language.json")
var _jsonLanguage      = buffer_read(_bufferLanguage, buffer_string);

languageTable = json_parse(_jsonLanguage);

global.gameOptions = {
	music: _musicOption,
	sound: _soundOption,
	fullscreen: _fullscreenOption,
	language: _systemLanguagenOption,
	detectionTimer: true,
}

setLanguage(global.gameOptions.language);

window_set_fullscreen(global.gameOptions.fullscreen);

global.windowHeight = window_get_height();
global.windowWidth = global.windowHeight * 1.77777777;

window_set_min_height(270);
window_set_min_width(480);

switch (os_type) {
    case os_windows:
        global.platform = Platforms.WINDOWS;
        break;
    case os_gxgames:
        global.platform = Platforms.GX;
        break;
    case os_linux:
        global.platform = Platforms.LINUX;
        break;
    case os_macosx:
        global.platform = Platforms.OSX;
        break;
    case os_ios:
        global.platform = Platforms.IOS;
        break;
    case os_tvos:
        global.platform = Platforms.APPLE_TV;
        break;
    case os_android:
        global.platform = Platforms.ANDROID;
        break;
    case os_ps4:
        global.platform = Platforms.PS4;
        break;
    case os_ps5:
        global.platform = Platforms.PS5;
        break;
    case os_gdk:
        global.platform = Platforms.XBOX;
        break;	
    case os_switch:
        global.platform = Platforms.SWITCH;
        break;
}

if(os_browser != browser_not_a_browser) {
	global.platform = Platforms.BROWSERS;
}

show_debug_message("Platform: {0}", global.platform);

global.frame = 0;

gameIsReady = false;

global.steamIsReady = false;


if(STEAM) {
	show_debug_message("Will load steam");
	if (steam_initialised()) {
		
		gameIsReady = true;
		
		if steam_stats_ready() && steam_is_overlay_enabled()
	    {
	        global.steamIsReady = true;
	    }
	} else {
		show_debug_message("Steam is not ready");
	}
} else {
	gameIsReady = true;
	
}
