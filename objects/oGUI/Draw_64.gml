

if(!global.pause) {
	
	animationFrame = 0;

	frameCounter++;

	if(frameCounter >= 60) {
		frameCounter = 0;	
	}

	if(frameCounter > 29) {
		animationFrame = 1	
	}
}

with(oPlayer) {


//effect_create_above()

	if(other.currentCameraBuffer != -1) {
		
		var activeCameraObject = currentCamerasObject[other.currentCameraBuffer];
	
		if(activeCameraObject.status == CameraStatus.ACTIVE) {
			draw_sprite(sCameraOverlay, other.animationFrame, 0, 0);
		} else {
			// Always display the frame without the red dot
			//draw_sprite(sCameraOverlay, 0, 0, 0); 
			draw_sprite(sCameraOff, other.animationFrame, 0, 0);
		}
	
		var maxIndexActive = array_length(currentCamerasObject);
	
		for(var index = 0; index < 10; index++) {
		
			var drawY = floor(index / 2) * 100;
			var drawX = ((index % 2) * 100) + 600;
		
	
			if(index < maxIndexActive) {
				var camera = currentCamerasObject[index];
				if(camera.status == CameraStatus.ACTIVE) {
					draw_sprite_stretched(sCameraOverlaySmall, other.animationFrame, drawX, drawY, 100, 100);
				} else {
					draw_sprite_stretched(sCameraOffSmall, other.animationFrame, drawX, drawY, 100, 100);
				}
			} else {
				draw_sprite_stretched(sCameraShutdownSmall, other.animationFrame, drawX, drawY, 100, 100);
			}
		}
	
		draw_set_color(c_black);
		//draw_rectangle(600, 500, 800, 600, false);
	}


	if(other.currentCameraBuffer != currentCameraIndex) {
		other.currentCameraBuffer = currentCameraIndex;
	}
}