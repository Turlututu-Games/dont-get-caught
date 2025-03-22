global.inputs = getInputs();
global.debugVariables = [
	// ["gamePaused",global.gamePaused]
];


if(DEBUG) {
	frame++;
	if(frame >= game_get_speed(gamespeed_fps)) {
		frame = 0;	
	}
}

var _windowWidth = window_get_width();
var _windowHeight = window_get_height();



if(_windowWidth != global.windowWidth || _windowHeight != global.windowHeight) {
	
	global.windowHeight = window_get_height();
	global.windowWidth = global.windowHeight * 1.77777777;
	
	// 1.777777778
	
	// window_set_size(global.windowWidth, global.windowHeight);
	surface_resize(application_surface, global.windowWidth, global.windowHeight);	
}

addDebugVariable("fps", game_get_speed(gamespeed_fps))
addDebugVariable("frame", frame);

addDebugVariable("windowHeight", global.windowHeight)
addDebugVariable("windowWidth", global.windowWidth)
