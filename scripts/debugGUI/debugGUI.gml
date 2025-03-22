function debugGUI(element, index)
{
	var name = element[0];
	var value = element[1];
	var text = name + ": " + string(value);
	var position = (index * 20) + 40;
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_bottom);
	draw_text(40,position, text);
}

/// @func addDebugVariable(name, value) Add a variable to the debug output for the current step
/// @param {string} name Name of the variable
/// @param {any} value Value to display
function addDebugVariable(name, value) {
	array_push(global.debugVariables, [name, value]);
}