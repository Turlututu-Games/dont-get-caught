if(global.pause) {
	
	var _up = global.inputs.upMenu;
	var _down = global.inputs.downMenu;	
	
	 global.pauseMenu.step(_up, _down);
	
	
	if(global.inputs.validateMenu) {

		global.pauseMenu.execute();

		global.pause = false;

	}
}