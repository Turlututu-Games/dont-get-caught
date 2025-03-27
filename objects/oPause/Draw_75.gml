/// @description Pause Menu

if(global.pause) {
	
	
	draw_set_color(c_black);
	draw_set_alpha(0.75);
	draw_rectangle(0,0,global.windowWidth,global.windowHeight,false);
	resetTexts();
	
	drawTextGUITemplate(global.windowWidth * 0.5, global.windowHeight * 0.3, translate("Pause"), TextTemplate.MENU_TITLE);
	
	draw_set_font(fMenu48);
	
	global.pauseMenu.render(
		global.windowWidth * 0.5, 
		global.windowHeight * 0.5, 
		48 * 2,
		false,
		true,
		DEBUG
	);
	
	/*if(global.pauseOptions != undefined) {
		for(var _i = 0; _i < array_length(global.pauseOptions); _i++) {
			var _print = "";

			if(_i == pauseOptionSelected) {
				_print += "> " + global.pauseOptions[_i][0] + " <";
			} else {
				_print += global.pauseOptions[_i][0];	
				draw_set_alpha(0.7);
			}
			draw_text(RES_W * 0.5, RES_H * 0.5 + (_i * 48), _print);
			draw_set_alpha(1.0)
		}
	}*/
	
	
	
	//if(global.pauseOptions != undefined) {
		//textsDraw(room_width / 2, room_height / 2, "Pause", 48);
	//}
	
	/*surface_set_target(application_surface);
	if(surface_exists(pauseSurf)) {
		draw_surface(pauseSurf,0,0)
	} else {
		pauseSurf = surface_create(RES_W, RES_H);
		buffer_set_surface(pauseSurfBuffer, pauseSurf,0);
	}
	surface_reset_target();*/
	

}