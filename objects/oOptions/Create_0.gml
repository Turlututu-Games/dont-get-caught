var _menuOptions = new MenuItemOptions();
_menuOptions.offsetX = -20;
_menuOptions.halign = fa_right;
_menuOptions.doubleWidth = true;
_menuOptions.minimalWidth = room_width * 0.3;

var _menuReturnOptions = new MenuItemOptions();
_menuReturnOptions.doubleWidth = true;
_menuReturnOptions.minimalWidth = room_width * 0.3;

function returnToMenu() {
	
	room_goto(rMenu);
	
	/*for (var _i = 0; _i < instance_count - 1; ++_i)
	{
	    var _instance = instance_find(all,_i);
			
			
		if(variable_instance_exists(_instance, "cleanupInstance") && _instance.cleanupInstance == true) {
			instance_destroy(_instance);
		}
	}*/
	

}

var _menu = [
	new MenuItem(Translation.OPTION_MUSIC, toggleOptionMusic, _menuOptions),
	new MenuItem(Translation.OPTION_SOUND, toggleOptionSound, _menuOptions),	
	new MenuItem(Translation.OPTION_LANGUAGE, toggleOptionLanguage, _menuOptions),

];

var _getMusic = function() { return global.gameOptions.music };
var _getSound = function() { return global.gameOptions.sound };
var _getLanguage = function() { return global.gameOptions.language };

var _getFullscreen = function() { return global.gameOptions.fullscreen };



displayOptions = [
	[_getMusic, [Translation.OPTION_VOLUME_LOW, Translation.OPTION_VOLUME_MEDIUM, Translation.OPTION_VOLUME_HIGH]],
	[_getSound, [Translation.OPTION_VOLUME_LOW, Translation.OPTION_VOLUME_MEDIUM, Translation.OPTION_VOLUME_HIGH]],
	[_getLanguage, {"en": Translation.OPTION_LANGUAGE_ENGLISH, "fr": Translation.OPTION_LANGUAGE_FRENCH}],

	//,
]

//if(!STEAM) {
	array_push(_menu, new MenuItem(Translation.OPTION_DISPLAY, toggleOptionFullScreen, _menuOptions));
	array_push(displayOptions, [_getFullscreen, [Translation.OPTION_NO_FULL_SCREEN, Translation.OPTION_FULL_SCREEN]]);
//}

// array_push(_menu, new MenuItem("credits", function() { room_goto(rCredits); }));
array_push(_menu, new MenuItem(
	Translation.MENU_RETURN_TO_MENU,
	returnToMenu,
	_menuReturnOptions
));

menu = new Menu(_menu);

/* getRenderOption = function(_i) {
	
	var _current = displayOptions[_i];
	
	var _optionValue = _current[0]();
			
	if(is_bool(_optionValue)) {
		_optionValue = _optionValue ? 1 : 0;
	}
	
	if(!is_string(_optionValue)) {
		return translate(_current[1][_optionValue]);	
	}
			
	//return translate(_current[1])
}*/