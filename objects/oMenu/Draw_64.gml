resetTexts();

var _startX = global.windowWidth * 0.5;
var _startY =  global.windowHeight * 0.5

var _sizes = getMenuSizes();

draw_rectangle(_sizes.menuX, _sizes.menuY, _sizes.menuX+10, _sizes.menuY+10, false)

draw_set_font(fMenu);

menu.render(_sizes.menuX, _sizes.menuY, 36, false, true, false);