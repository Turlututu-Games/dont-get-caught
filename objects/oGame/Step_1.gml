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
	

	
	global.windowHeight = _windowHeight;
	var _newWidth = round(_windowHeight * RATIO);
	
	global.windowWidth = _newWidth;
	
	show_debug_message("Set global resolution: {0}x{1}", _newWidth, _windowHeight );
	
	if(_ratio == -1) {
		global.windowSizeRatio = 1;	
		_initialHeight = _windowHeight;
	} else {
		global.windowSizeRatio = _windowHeight / _initialHeight;
	}
	
	var _windowWidthGUIMargin = _newWidth * 0.04;
	var _windowHeightGUIMargin = _windowHeight * 0.08;
	
	global.windowLeftGUIMargin = _windowWidthGUIMargin;
	global.windowTopGUIMargin = _windowHeightGUIMargin;
	
	global.windowRightGUIMargin = _newWidth - _windowWidthGUIMargin;
	global.windowDownGUIMargin = _windowHeight - _windowHeightGUIMargin;
	
	// window_set_size(global.windowWidth, global.windowHeight);
	surface_resize(application_surface, _newWidth, _windowHeight);	
}

addDebugVariable("fps", game_get_speed(gamespeed_fps))
addDebugVariable("frame", global.frame);

addDebugVariable("real windowHeight", _windowHeight)
addDebugVariable("real windowWidth", _windowWidth)

addDebugVariable("windowHeight", global.windowHeight)
addDebugVariable("windowWidth", global.windowWidth)
addDebugVariable("windowSizeRatio", global.windowSizeRatio)

// addDebugVariable("build_date",  date_date_string(GM_build_date))
