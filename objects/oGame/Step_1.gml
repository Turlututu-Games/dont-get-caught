global.inputs = getInputs();
global.debugVariables = [
	// ["gamePaused",global.gamePaused]
];


if(DEBUG) {
	global.frame++;
	if(global.frame >= game_get_speed(gamespeed_fps)) {
		global.frame = 0;	
	}
}

var _windowWidth = window_get_width();
var _windowHeight = window_get_height();



if(_windowWidth != global.windowWidth) {
	
	global.windowHeight = window_get_height();
	var _newWidth = round(global.windowHeight * RATIO);
	
	global.windowWidth = _newWidth;
	
	
	if(global.windowSizeRatio == -1) {
		global.windowSizeRatio = 1;	
		_initialHeight = global.windowHeight;
	} else {
		global.windowSizeRatio = global.windowHeight / _initialHeight;
	}
	
	// 1.777777778
	
	// window_set_size(global.windowWidth, global.windowHeight);
	surface_resize(application_surface, global.windowWidth, global.windowHeight);	
}

addDebugVariable("fps", game_get_speed(gamespeed_fps))
addDebugVariable("frame", global.frame);

addDebugVariable("windowHeight", global.windowHeight)
addDebugVariable("windowWidth", global.windowWidth)

// addDebugVariable("build_date",  date_date_string(GM_build_date))
