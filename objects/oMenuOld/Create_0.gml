/// @description GUI/Vars/Menu setup


//guiWidth = display_get_gui_width();
//guiHeight = display_get_gui_height();
// show_debug_message("GUI - width: {0}, height: {1}", guiWidth, guiHeight);
var _sizes = getMenuSizes();
guiXMargin =_sizes.guiXMargin;
guiYMargin = _sizes.guiYMargin;

menuXMargin = _sizes.menuXMargin

menuX = _sizes.menuX;
menuY = _sizes.menuY;
menuXTarget = _sizes.menuXTarget;
menuSpeed = 25; // lower is faster;
menuFont = fMenu;
menuItemHeight = font_get_size(menuFont);
menuCommitted = -1;
menuControl = true;


enum MenuItem2 {
	Demo = 2,
	Debug = 1,
	Quit = 0
}

menu = [
	{action: MenuItem2.Demo, text: "Demo"},
	{action: MenuItem2.Debug, text: "Debug Room"},
	{action: MenuItem2.Quit, text: "Quit"},	
]

// Inverse order !
menu = array_reverse(menu);


menuLength = array_length(menu);

menuTop = menuY - ((menuItemHeight * 1.5) * menuLength);

menuCursor = menuLength - 1;

playMusic(musicMenu);
