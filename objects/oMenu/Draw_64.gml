resetTexts();


var _sizes = getMenuSizes();

draw_set_font(fMenu);

menu.render(_sizes.menuX, _sizes.menuY, 36, false, true, false);

var _buildOffsetX = global.windowWidth / 30;
var _buildOffsetY = global.windowHeight / 20;

textsDrawSetup(24, fa_left, fa_bottom);
//draw_text(_buildOffsetX, global.windowHeight - _buildOffsetY, version);
draw_text(0, global.windowHeight, version);
