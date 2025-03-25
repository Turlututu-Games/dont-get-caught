functionToCall = function() {
	with(oTriggerTuto3) {
		// The trigger is only here to set the position of the text
		var _instance = instance_create_layer(x, y, LEVEL_DESIGN_LAYER, oFixedText);
		with(_instance) {
			_inputs = ["tutoKeepMoving", sKeyboardRight];
			_halign = fa_right;
		}
		
		
	}
}