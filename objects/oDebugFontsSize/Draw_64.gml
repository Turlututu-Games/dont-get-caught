
var _quarters = global.windowHeight / 4;
var _half = global.windowWidth / 3;
var _border = global.windowHeight / 12;

draw_set_valign(fa_top);
draw_set_halign(fa_center);

drawTextGUI(_half , _border, "Base Text", undefined, fMenu);
drawTextGUI(_half, _quarters + _border ,  "Text 28", undefined, fMenu28);
drawTextGUI(_half, _quarters * 2 + _border,  "Text 48", undefined, fMenu48);
drawTextGUI(_half, _quarters * 3 + _border,  "Text 72", undefined, fMenu72);
