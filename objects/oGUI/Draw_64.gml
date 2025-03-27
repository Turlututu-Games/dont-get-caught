
var _running = !global.pause && image_speed != 0;

if(_running) {
	
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


with(oPlayer) {


//effect_create_above()

	if(other.currentCameraBuffer != -1) {
		
		var activeCameraObject = currentCamerasObject[other.currentCameraBuffer];
		
		var _textPositionX = _mainWidth * 0.5;// window_mouse_get_x(); // 100
		//var _textPositionX = window_mouse_get_x(); // 100
		var _textPositionY = _sideHeight / 3;// window_mouse_get_y(); // 100
		//var _textPositionY = window_mouse_get_y(); 
		
		//var _previousAlpha = draw_get_alpha();
		//drawSetText(c_white, fMenu28, fa_left, fa_middle, 0.2);
		
		// var _angle = point_direction(_textPositionX, _textPositionY,window_mouse_get_x(), window_mouse_get_y());
				
				
		drawTextGUI(_textPositionX, _textPositionY, string(activeCameraObject.cameraName, other.currentCameraBuffer + 1), TextColor.LIGHT, TextSize.MAIN_LABEL, TextAlign.CENTER, false, 0.2);
					
	
		if(activeCameraObject.status == CameraStatus.ACTIVE) {
			draw_sprite_stretched(sCameraOverlay, other.animationFrame, 0, 0, _mainWidth, _mainHeight);
		} else {
			// Always display the frame without the red dot
			//draw_sprite(sCameraOverlay, 0, 0, 0); 
			draw_sprite_stretched(sCameraOff, other.animationFrame, 0, 0, _mainWidth, _mainHeight);
		}
		
		//var _textPositionX = _mainWidth / 20;
		//var _textPositionY = _mainHeight / 20;
		

		//draw_text_transformed(_textPositionX, _textPositionY, string(activeCameraObject.cameraName, other.currentCameraBuffer), 1, 1, 357);
	
		//draw_set_alpha(_previousAlpha);
	
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