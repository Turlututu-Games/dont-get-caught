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
var _ratio = global.windowSizeRatio;


if(_windowWidth != global.windowWidth) {
	

	// Force the resolution on bounds
	var _normalizedHeight = minMax(_windowHeight, 480, 2160);
	global.windowHeight = _normalizedHeight;
	var _newWidth = round(_normalizedHeight * RATIO);
		
	global.windowWidth = _newWidth;
	
	show_debug_message("Set global resolution: {0}x{1}", _newWidth, _normalizedHeight );
	
	if(_ratio == -1) {
		global.windowSizeRatio = 1;	
		_initialHeight = _normalizedHeight;
	} else {
		global.windowSizeRatio = _normalizedHeight / _initialHeight;
	}
	
	var _windowWidthGUIMargin = _newWidth * 0.04;
	var _windowHeightGUIMargin = _normalizedHeight * 0.08;
	
	global.windowLeftGUIMargin = _windowWidthGUIMargin;
	global.windowTopGUIMargin = _windowHeightGUIMargin;
	
	global.windowRightGUIMargin = _newWidth - _windowWidthGUIMargin;
	global.windowDownGUIMargin = _normalizedHeight - _windowHeightGUIMargin;
	
	//writeDebugLog(string("Set global resolution: {0}x{1}", _newWidth, _windowHeight ));
	// window_set_size(global.windowWidth, global.windowHeight);
	surface_resize(application_surface, _newWidth, _normalizedHeight);	
}

addDebugVariable("fps", game_get_speed(gamespeed_fps))
addDebugVariable("frame", global.frame);

addDebugVariable("real windowHeight", _windowHeight)
addDebugVariable("real windowWidth", _windowWidth)

addDebugVariable("windowHeight", global.windowHeight)
addDebugVariable("windowWidth", global.windowWidth)
addDebugVariable("windowSizeRatio", global.windowSizeRatio)

// addDebugVariable("build_date",  date_date_string(GM_build_date))
