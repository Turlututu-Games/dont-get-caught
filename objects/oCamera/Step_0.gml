
// Update object position
// Division by 25 it to make smooth movements
//x += (xTo - x) / 25;
//y += (yTo - y) / 25;
switch(status) {
	case CameraStatus.ACTIVE:
		x = xTo;
		y = yTo;
		break;
	case CameraStatus.OFF:
		if(instance_exists(oOffline)) {
			with(oOffline) {
				other.x = xstart;
				other.y = ystart;
			}
		} else {
			x = -1000
			y = -1000
		}
		break;
	
}


// Prevent camera to go outside of the room
//x = clamp(x, view_w_half, room_width - view_w_half);
//y = clamp(y, view_h_half, room_height - view_h_half);


// Update camera view
camera_set_view_pos(cam, x - view_w_half, y - view_h_half);


