/* global.debugVariables = [
	["pause",global.pause]
];*/

if(global.pause != previousState) {
	previousState = global.pause;
	global.pauseToggle = true;
} else {
	global.pauseToggle = false;	
}

// addDebugVariable("global.pause", global.pause);