// Item ease in
menuX += (menuXTarget - menuX) / menuSpeed;

function selectMenuItem() {
	menuXTarget = global.windowWidth + menuXMargin;
	menuCommitted = menuCursor;
	// screenShaker(4,30);
}

function enterGame() {
	menuControl = false;
	audio_stop_sound(snMusicMenu);
	audio_play_sound(snStartGame, 10, false);
	audio_play_sound(snMusic, 10, true, 0.2);
	slideTransition(Transition.GOTO, rTuto1); 
}

// Keyboard Controls
if(menuControl) {
	if(global.inputs.upMenu) {
		audio_play_sound(snClickMenu, 10, false);
		menuCursor++;	
		if(menuCursor >= menuLength) {
			menuCursor = 0;	
		}
	}
	
	if(global.inputs.downMenu) {
		menuCursor--;	
		audio_play_sound(snClickMenu, 10, false);
		if(menuCursor < 0) {
			menuCursor = menuLength - 1;	
		}
	}
	
	if(global.inputs.validateMenu) {
		selectMenuItem();
	}
	
	var mouseYGui = device_mouse_y_to_gui(0);
	
	if(mouseYGui < menuY && mouseYGui > menuTop) {
		var newMenuCursor = (menuY - mouseYGui) div (menuItemHeight * 1.5);
		if(menuCursor != newMenuCursor) {
			audio_play_sound(snClickMenu, 10, false);
			menuCursor = newMenuCursor;
		}
		
		if(global.inputs.clickMenu) {
			selectMenuItem();
		}
	}
}

if(menuX > global.windowWidth + (menuXMargin * 0.75) && menuCommitted != -1) {
	var _menuAction = menu[menuCommitted].action;
	menuCommitted = -1;
	switch(_menuAction) {
		case MenuItem2.Demo: 
		default: 	
			enterGame();
			break;
		case MenuItem2.Quit:
			game_end();
			break;
	}
}