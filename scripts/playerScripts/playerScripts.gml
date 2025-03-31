function playerUpdateSprite() {
	with(oPlayer) {
		var _totalFrames = sprite_get_number(sprite_index);
		
		// Set the image_index to the correct offset in the sprite
		image_index = localFrame + (HORIZONTAL_DIR * _totalFrames);
	
		// Increments the local_frame using the sprite speed and the frame rate
		localFrame += sprite_get_speed(sprite_index) /  FPS;
	
		// show_debug_message("localFrame {0}", localFrame);
	
		if(localFrame >= _totalFrames) {
			// The local_frame outbound the animation. Reseting-it to the first index
			animationEnd = true;	
			localFrame -= _totalFrames;
		} else {
			// the local_frame is in the bound
			animationEnd = false;	
		}
	}
}

/// @func playerMovePassthrough() Move the player ignoring all collision. For forced movements (jump, animation, etc)
function playerMovePassthrough() {
	with(oPlayer) {
		x += horizontalSpeed;
		y += verticalSpeed;
	}
}

