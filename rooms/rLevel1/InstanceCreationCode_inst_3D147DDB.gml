functionToCall = function() {
	if(!instance_exists(oText)) {
		with(instance_create_layer(x, y - 64, layer, oText)) {
			text = "End of demo";
			length = string_length(text);
		}
	}
	
	with(oPlayer) {
		hasControl = false;	
	}
	
	audio_play_sound(snEnding, 10, false);
}