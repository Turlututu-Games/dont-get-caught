enum Transition {
	OFF,
	NEXT,
	GOTO,
	RESTART,
	INTRO,
	MENU,
	EXIT_MENU
}


/// @function slideTransition(transitionMode, targetRoom?);
/// @param {Struct.Transition} transitionMode Sets transition mode between netx, restart and goto.
/// @param {Asset.GMRoom} targetRoom Sets target room when using the goto mode.
function slideTransition(transitionMode, targetRoom = undefined) {
	with(oTransition) {
		mode = transitionMode;
		if(targetRoom != undefined) {
			target = targetRoom;
		}
	}
}