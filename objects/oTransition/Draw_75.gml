if(mode != Transition.OFF) {
	draw_set_color(c_black);
	draw_set_alpha(percent);
	draw_rectangle(
		0, 
		0,	
		window_get_width(),
		window_get_height(),
		false
	);
	draw_set_alpha(1);	
}