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

global.windowHeight = window_get_height();
global.windowWidth = global.windowHeight * 1.77777777;
global.windowSizeRatio = -1;

_initialHeight = 0;


global.frame = 0;

gameIsReady = false;
gameIsSetup = false;

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
