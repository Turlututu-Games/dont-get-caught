functionToCall = function() {
	with(oTriggerTuto3) {
		// The trigger is only here to set the position of the text
		var _instance = instance_create_layer(x, y, LEVEL_DESIGN_LAYER, oFixedText);
		with(_instance) {
			_inputs = [getTranslationKey(Translation.TUTO_KEEP_MOVING), sKeyboardRight];
			_align = TextAlign.RIGHT;
		}
		
		
	}
}