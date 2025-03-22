/// @description Draw debug info

if(DEBUG) {
	for(var _i = 0; _i < array_length(global.debugVariables); _i++) {
		debugGUI(global.debugVariables[_i], _i);
	}
}
