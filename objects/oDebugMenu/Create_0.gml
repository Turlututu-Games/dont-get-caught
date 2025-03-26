global.allowPause = false;

var _menuOptions = new MenuItemOptions();
_menuOptions.halign = fa_right;

var _menu = [
	//new MenuItem("menuStartDemo", _startDemo, _menuOptions), Temporary disabled
	new MenuItem("Return to Main Menu", function() { room_goto(rMenu)}, _menuOptions),
	new MenuItem("Test Font Sizes",  function() { room_goto(rDebugFontSizes)}, _menuOptions),
	new MenuItem("Test Moving Platform",  function() { room_goto(rDebugMovingPlatform)}, _menuOptions),
	new MenuItem("Test Moving Camera",  function() { room_goto(rDebugMovingCamera)}, _menuOptions),
];



menu = new Menu(_menu);
