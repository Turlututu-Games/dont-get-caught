// Inherit the parent event
event_inherited();

var _optionReturnToMenu = new MenuItem("menuReturnToMenu", function() {
	slideTransition(Transition.GOTO, rMenu); 
});

var _optionExitToDesktop = new MenuItem("exit", function() {
	game_end();
});	

menu = new Menu([
	_optionReturnToMenu,
	_optionExitToDesktop
]);


functionToCallOnStepTrigger = function() {
	menu.step();
	
	
	if(global.inputs.validateMenu) {
		menu.execute();
	}	
}
	
functionToCallOnDrawTrigger = function() {
	draw_set_color(c_black);
	draw_set_alpha(0.75);
	draw_rectangle(0,0,global.windowWidth,global.windowHeight,false);
	resetTexts();
	
	drawTextGUITemplate(global.windowWidth * 0.5, global.windowHeight * 0.3, translate("endOfDemo"), TextTemplate.MENU_TITLE );
	
	draw_set_font(fMenu48);
	
	renderMenuTemplate(menu, MenuTemplate.CENTER);
}

functionToCall = function() {
		
	playSound(sfxEnding);
	
	with(oPlayer) {
		hasControl = false;	
	}
	
	global.allowPause = false;
	
	sprite_index = noone;
	visible = true;
	
	with(oGameObject) {
		global.gamePausedImageSpeed = image_speed;
		image_speed = 0;
	}
	
}