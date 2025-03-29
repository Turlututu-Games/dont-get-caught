
menu.step();

if(global.inputs.validateMenu) {
 menu.execute();
}

if(STEAM && global.steamIsReady && !richPresenceSet) {
	steam_set_rich_presence("steam_display", "Home menu");
}