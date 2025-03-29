var _options = readOptionsConfig();


var _bufferLanguage    = buffer_load( working_directory + "language.json")
var _jsonLanguage      = buffer_read(_bufferLanguage, buffer_string);

with(oGame) {
	languageTable = json_parse(_jsonLanguage);
}

global.gameOptions = {
	music: _options.musicOption,
	sound: _options.soundOption,
	fullscreen: _options.fullscreenOption,
	language: _options.systemLanguagenOption,
	detectionTimer: true,
}

setLanguage(global.gameOptions.language);

window_set_fullscreen(global.gameOptions.fullscreen);


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

room_goto(rMenu);	