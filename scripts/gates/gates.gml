function openGate(_trigger, _gateObject, _colorUcFirst) {
	var _instancesNumber = instance_number(_gateObject);
	var _instances = [];

	for (var i = 0; i < _instancesNumber; ++i;)
	{
		_instances[i] = instance_find(_gateObject, i);
	}

	for (var i = 0; i < _instancesNumber; ++i;)
	{
		instance_destroy(_instances[i]);
	}
	
	with(_trigger) {
		sprite_index = sComputerOff;
		used = true;
	}
	
	displayMessage(string(translate("computerGateOpen"), _colorUcFirst));
	playSound(sfxComputerOpenGate);
	
}

function noKey(_colorUcFirst) {
	displayMessage(string(translate("computerMissingKey"), _colorUcFirst));
	playSound(sfxComputerError);
}
