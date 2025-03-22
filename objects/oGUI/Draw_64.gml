

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

var _mainWidth = global.windowWidth / 1.333333333;
var _mainHeight = global.windowHeight;

var _sideWidth = global.windowWidth / 8;
var _sideHeight = global.windowHeight / 6;

addDebugVariable("_mainWidth", _mainWidth);
addDebugVariable("_mainHeight", _mainHeight);
addDebugVariable("_sideWidth", _sideWidth);
addDebugVariable("_sideHeight", _sideHeight);



with(oPlayer) {


//effect_create_above()

	if(other.currentCameraBuffer != -1) {
		
		var activeCameraObject = currentCamerasObject[other.currentCameraBuffer];
	
		if(activeCameraObject.status == CameraStatus.ACTIVE) {
			draw_sprite_stretched(sCameraOverlay, other.animationFrame, 0, 0, _mainWidth, _mainHeight);
		} else {
			// Always display the frame without the red dot
			//draw_sprite(sCameraOverlay, 0, 0, 0); 
			draw_sprite_stretched(sCameraOff, other.animationFrame, 0, 0, _mainWidth, _mainHeight);
		}
	
		var maxIndexActive = array_length(currentCamerasObject);
	
		for(var index = 0; index < 10; index++) {
		
			var drawY = floor(index / 2) * _sideHeight;
			var drawX = ((index % 2) * _sideWidth) + _mainWidth;
		
	
			if(index < maxIndexActive) {
				var camera = currentCamerasObject[index];
				if(camera.status == CameraStatus.ACTIVE) {
					draw_sprite_stretched(sCameraOverlaySmall, other.animationFrame, drawX, drawY, _sideWidth, _sideHeight);
				} else {
					draw_sprite_stretched(sCameraOffSmall, other.animationFrame, drawX, drawY, _sideWidth, _sideHeight);
				}
			} else {
				draw_sprite_stretched(sCameraShutdownSmall, other.animationFrame, drawX, drawY, _sideWidth, _sideHeight);
			}
		}
	
		draw_set_color(c_black);
		//draw_rectangle(600, 500, 800, 600, false);
	}


	if(other.currentCameraBuffer != currentCameraIndex) {
		other.currentCameraBuffer = currentCameraIndex;
	}
}