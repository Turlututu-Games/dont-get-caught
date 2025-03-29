steam_update();

if (!global.steamIsReady && steam_initialised()) {
	var _steamStatReady = steam_stats_ready();
		
	if (_steamStatReady) {
	    global.steamIsReady = true;
		show_debug_message("Steam is ready: {0}", global.steamIsReady);
	}
}

if(gameIsReady && !gameIsSetup) {
	gameIsSetup = true;
	
	show_debug_message("Game is ready. Steam: {0}", global.steamIsReady);
	instance_create_layer(x, y, layer, oSetup);
	instance_create_layer(x, y, layer, oPause);
	instance_create_layer(x, y, layer, oTransition);
}

if(global.mouseCursor != cursorDisplayed) {
	cursor_sprite = global.mouseCursor ? cr_arrow : cr_none;
	cursorDisplayed = global.mouseCursor;
	show_debug_message("Switching cursor : {0}", global.mouseCursor);
}
