function debugGUI(element, index)
{
	var _offset = global.windowTopGUIMargin;
	
	var name = element[0];
	var value = element[1];
	var text = name + ": " + string(value);
	var position = (index * (_offset * 0.5)) + _offset;
	
	drawTextGUITemplate(global.windowLeftGUIMargin, position, text, TextTemplate.STANDARD_SHADOW);
}

/// @func addDebugVariable(name, value) Add a variable to the debug output for the current step
/// @param {string} name Name of the variable
/// @param {any} value Value to display
function addDebugVariable(name, value) {
	array_push(global.debugVariables, [name, value]);
}