resetTexts();

var _sizes = getMenuSizes();

draw_set_font(fMenu);

menu.render(_sizes.menuX, _sizes.menuY, 36, false, true, DEBUG);

drawTextGUITemplate(0, global.windowHeight, version, TextTemplate.STANDARD)

