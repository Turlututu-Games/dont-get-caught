



functionToCall = function() {
	
	var _optionReturnToMenu = new MenuItem("menuReturnToMenu", function() {
		slideTransition(Transition.GOTO, rMenu); 
	});

	var _optionExitToDesktop = new MenuItem("exit", function() {
		game_end();
	});	
	
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
	
	self.store = new Menu([
		_optionReturnToMenu,
		_optionExitToDesktop
	])
	
	self.functionToCallOnStep = function() {
		self.store.step();
	
	
		if(global.inputs.validateMenu) {
			self.store.execute();
		}	
	}
	
	self.functionToCallOnDraw = function() {
		draw_set_color(c_black);
		draw_set_alpha(0.75);
		draw_rectangle(0,0,global.windowWidth,global.windowHeight,false);
		resetTexts();
		draw_set_font(fMenu72);
	
		draw_text(global.windowWidth * 0.5, global.windowHeight * 0.3, translate("endOfDemo"));
	
		draw_set_font(fMenu48);
	
		store.render(
			global.windowWidth * 0.5, 
			global.windowHeight * 0.5, 
			48 * 2,
			false,
			true,
			DEBUG
		);
	}
	
	
	/* if(!instance_exists(oFloatingTextBox)) {
		with(instance_create_layer(x, y - 64, layer, oFloatingTextBox)) {
			text = translate("endOfDemo");
			length = string_length(text);
		}
	} */
	

	
	
}