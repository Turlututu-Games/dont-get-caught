used = false;

function displayMessage(msg) {
	if(!instance_exists(oFloatingTextBox)) {
		with(instance_create_layer(x, y - 64, layer, oFloatingTextBox)) {
			text = msg;
			length = string_length(msg);
		}
	}
}