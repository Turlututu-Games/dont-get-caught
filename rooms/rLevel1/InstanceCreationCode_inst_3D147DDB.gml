functionToCall = function() {
	if(!instance_exists(oFloatingTextBox)) {
		with(instance_create_layer(x, y - 64, layer, oFloatingTextBox)) {
			text = translate("endOfDemo");
			length = string_length(text);
		}
	}
	
	with(oPlayer) {
		hasControl = false;	
	}
	
	playSound(sfxEnding);
}