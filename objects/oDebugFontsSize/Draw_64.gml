
var _quarters = global.windowHeight / 4;
var _half = global.windowWidth / 3;
var _border = global.windowHeight / 12;

draw_set_valign(fa_top);
draw_set_halign(fa_center);

drawTextGUI(_half , _border, "Base Text", undefined, TextSize.TEXT);
drawTextGUI(_half, _quarters + _border ,  "Text 28", undefined, TextSize.MAIN_LABEL);
drawTextGUI(_half, _quarters * 2 + _border,  "Text 48", undefined, TextSize.LARGE_LABEL);
drawTextGUI(_half, _quarters * 3 + _border,  "Text 72", undefined, TextSize.TITLE);
