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

addDebugVariable("fps", game_get_speed(gamespeed_fps))
addDebugVariable("framep", frame);