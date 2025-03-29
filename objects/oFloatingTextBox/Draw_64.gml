var posX = global.windowWidth * 0.375;
var posY = global.windowHeight * 0.5;

var _ratio = global.windowSizeRatio;

var fullWidth = textboxWidth * _ratio;
var halfWidth = fullWidth * 0.5;
var _textboxBorder = textboxBorder * _ratio;
var _textboxHeight = textboxHeight * _ratio;

// Draw the Box
draw_set_color(c_black);
draw_set_alpha(0.5)

draw_rectangle(
	posX - halfWidth - _textboxBorder, 
	posY - _textboxHeight - (_textboxBorder * 2),
	posX + halfWidth + _textboxBorder,
	posY,
	false);
	
	
// Draw the Text
drawTextGUI(posX, posY - _textboxHeight - _textboxBorder, textCurrent, TextColor.LIGHT, TextSize.TEXT, TextAlign.TOP, true, 1);

draw_set_alpha(1)