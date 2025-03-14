global.allowPause = false;

var _menuOptions = new MenuItemOptions();
// _menuOptions.offsetX = -20;
_menuOptions.halign = fa_right;
// _menuOptions.doubleWidth = true;
// _menuOptions.minimalWidth = global.windowWidth * 0.3;

var _startDemo = function() {
	playSound(snStartGame)
	playMusic(snMusic, 0.2)
	slideTransition(Transition.GOTO, rTuto1); 	
};

var _debugRooms = function() {

};

var _options = function() {
	slideTransition(Transition.GOTO, rOptions);
};

var _exit = function() {
	game_end();
};

var _menu = [
	new MenuItem("menuStartDemo", _startDemo, _menuOptions),
	new MenuItem("menuTestLevels", _debugRooms, _menuOptions),
	new MenuItem("options",_options, _menuOptions),
	new MenuItem("exit",_exit, _menuOptions),
];

menu = new Menu(_menu);

// audio_play_sound(snMusicMenu, 10, true, 0.2);
playMusic(snMusicMenu, 0.2)