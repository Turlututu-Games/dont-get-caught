if(global.inputs.restart) {
	room_restart();
}

// Pause the Game
if(global.inputs.pause) {
	global.gamePaused = !global.gamePaused;
	
	if(global.gamePaused) {
		with(all) {
			gamePausedImageSpeed = image_speed;	
			image_speed = 0;
		}
	} else {
		with(all) {
			if(gamePausedImageSpeed != undefined) {
				image_speed = gamePausedImageSpeed;
			}
		}	
	}
}