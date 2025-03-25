used = false;

function displayMessage(msg) {
	if(!instance_exists(oTextOld)) {
		with(instance_create_layer(x, y - 64, layer, oTextOld)) {
			text = msg;
			length = string_length(msg);
		}
	}
}