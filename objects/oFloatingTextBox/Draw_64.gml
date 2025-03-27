/// @description Insert description here
// You can write your code in this editor



var halfWidth = textboxWidth * 0.5;

var center = 300;

// Draw the Box
draw_set_color(c_black);
draw_set_alpha(0.5)
/*draw_roundrect_ext(
	x - halfWidth - textboxBorder, 
	y - textboxHeight - (textboxBorder * 2),
	x + halfWidth + textboxBorder,
	y,
	15,
	15,
	false
);*/
draw_rectangle(
	center - halfWidth - textboxBorder, 
	center - textboxHeight - (textboxBorder * 2),
	center + halfWidth + textboxBorder,
	center,
	false);

// Draw the Text
drawTextInGame(center, center - textboxHeight - textboxBorder, textCurrent, TextColor.LIGHT, TextSize.TEXT, TextAlign.TOP, true, 1);