
var _running = !global.pause && image_speed != 0;

show_debug_message("!global.pause: {0}, image_speed: {1}. Result: {2}", !global.pause, image_speed != 0, _running);

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
	
		if(activeCameraObject.status == CameraStatus.ACTIVE) {
			draw_sprite_stretched(sCameraOverlay, other.animationFrame, 0, 0, _mainWidth, _mainHeight);
		} else {
			// Always display the frame without the red dot
			//draw_sprite(sCameraOverlay, 0, 0, 0); 
			draw_sprite_stretched(sCameraOff, other.animationFrame, 0, 0, _mainWidth, _mainHeight);
		}
		
		//var _textPositionX = _mainWidth / 20;
		//var _textPositionY = _mainHeight / 20;
		
		var _textPositionX =_sideWidth * 0.75;// window_mouse_get_x(); // 100
		var _textPositionY = global.windowHeight - _sideHeight ;// window_mouse_get_y(); // 100
		
		//var _previousAlpha = draw_get_alpha();
		//drawSetText(c_white, fMenu28, fa_left, fa_middle, 0.2);
		
		// var _angle = point_direction(_textPositionX, _textPositionY,window_mouse_get_x(), window_mouse_get_y());
				
				
		// show_debug_message("draw_text {0} / {1} : {2}", _textPositionX, _textPositionY, string(activeCameraObject.cameraName,  other.currentCameraBuffer));
	
		drawTextGUI(_textPositionX, _textPositionY, string(activeCameraObject.cameraName, other.currentCameraBuffer + 1), c_white, fMenu28, fa_left, fa_middle, 0.2, 357);
	
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