window_set_size(global.windowWidth, global.windowHeight);
surface_resize(application_surface, global.windowWidth, global.windowHeight);

if(layer_exists(COLLISIONS_LAYER)) {
	layer_set_visible(COLLISIONS_LAYER, false);
}