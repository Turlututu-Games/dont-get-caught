global.allowPause = false;

var _menuOptions = new MenuItemOptions();
_menuOptions.halign = fa_right;

var _menuOptionsDesktop = new MenuItemOptions([Platforms.DESKTOP]);
_menuOptionsDesktop.halign = fa_right;

var _startDemo = function() {
	playSound(sfxStartGame)
	playMusic(musicMusicLevel, 0.2)
	slideTransition(Transition.GOTO, rTuto1); 
	global.allowPause = true;
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
	new MenuItem("menuStartDemo", _startDemo, _menuOptions), Temporary disabled
];

if(DEBUG) {
	array_push(_menu, new MenuItem("menuTestLevels", _debugRooms, _menuOptions));
}

array_push(_menu, new MenuItem("options",_options, _menuOptions));
array_push(_menu, new MenuItem("exit",_exit, _menuOptionsDesktop));


menu = new Menu(_menu);

playMusic(musicMenu, 0.2)

version = string_concat("v",GM_version," (",date_date_string(GM_build_date),")")