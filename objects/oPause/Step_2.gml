if(global.pause) {
	

	 global.pauseMenu.step();
	
	
	if(global.inputs.validateMenu) {
		global.pauseMenu.execute();
		global.pause = false;
	}
}