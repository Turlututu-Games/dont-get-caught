global.allowPause = false;

var _menuOptions = new MenuItemOptions();
_menuOptions.halign = fa_right;
_menuOptions.valign = fa_bottom;

var _menuOptionsDesktop = new MenuItemOptions([Platforms.DESKTOP]);
_menuOptionsDesktop.halign = fa_right;
_menuOptionsDesktop.valign = fa_bottom;

var _startDemo = function() {
	playSound(sfxStartGame)
	playMusic(musicMusicLevel, 0.2)
	slideTransition(Transition.GOTO, rTuto1); 
	global.allowPause = true;
};

var _playtest1Option1 = function() {
	global.gameOptions.detectionTimer = true;
	playSound(sfxStartGame)
	playMusic(musicMusicLevel, 0.2)
	slideTransition(Transition.GOTO, rTuto1);
	global.allowPause = true;
}

var _playtest1Option2 = function() {
	global.gameOptions.detectionTimer = false;
	playSound(sfxStartGame)
	playMusic(musicMusicLevel, 0.2)
	slideTransition(Transition.GOTO, rTuto1);
	global.allowPause = true;
}


var _debugRooms = function() {
	slideTransition(Transition.GOTO, rDebugMenu); 
};

var _options = function() {
	slideTransition(Transition.GOTO, rOptions);
};

var _exit = function() {
	game_end();
};

var _menu = [
	//new MenuItem("menuStartDemo", _startDemo, _menuOptions), Temporary disabled
	new MenuItem("menuPlaytest1Option1", _playtest1Option1, _menuOptions),
	new MenuItem("menuPlaytest1Option2", _playtest1Option2, _menuOptions),
];

if(DEBUG) {
	array_push(_menu, new MenuItem("menuTestLevels", _debugRooms, _menuOptions));
}

array_push(_menu, new MenuItem("options",_options, _menuOptions));
array_push(_menu, new MenuItem("exit",_exit, _menuOptionsDesktop));

// reverse, because of the fromBottom display
_menu = array_reverse(_menu);

menu = new Menu(_menu, true);

playMusic(musicMenu, 0.2)

version = string_concat("v",GM_version," (",date_date_string(GM_build_date),")")

richPresenceSet = false;
