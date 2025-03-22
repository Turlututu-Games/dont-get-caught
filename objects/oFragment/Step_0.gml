if(!global.pause) {
	// Bounce
	if(bounceCount != 0) {
		bounce += (pi * bounceSpeed);
		// Ensure we don't go further pi, because it's a negative slope
		if(bounce > pi) {
			bounce -= pi;	
			bounceHeight *= 0.6;
			bounceCount--;
		}
		z = sin(bounce) * bounceHeight;
	} else {
		z = 0;	
	}
	
	// Deteriorate
	deteriorate++;
	if(deteriorate > deteriorateAfter) {
		image_alpha -= 1/deteriorateTime;	
		if(image_alpha <= 0)  {
			instance_destroy()	;
		}
	}
	
	// Friction
	fric = 0.05;
	if(z == 0) {
		fric = 0.1;
	}
	
	// Move (old)
	/*x += lengthdir_x(spd,direction);
	y += lengthdir_y(spd,direction);
	if(tilemap_get_at_pixel(collisionMap, x, y) > 0) {
		spd = 0;	
	}*/

	// Move (new)
	var _x = lengthdir_x(spd,direction);
	var _y = lengthdir_y(spd,direction);
	//move_and_collide(_x, _y, collisionMap);
	x += _x;
	y += _y;
	
	spd = max(spd-fric, 0);

}