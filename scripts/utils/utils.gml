/// @function normalizePosition()
/// @desc Ensure the position is using integer value
function normalizePosition() {
	x = floor(x);
	y = floor(y);
}

/// @function minMax(val, minVal, maxVal)
/// @desc Clamp a value between min and max
/// @param {Real} val Value to test
/// @param {Real} minVal Minimum value
/// @param {Real} maxVal Maximum value
function minMax(val, minVal, maxVal) {
	return max(min(val, maxVal), minVal);	
}