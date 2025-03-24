resetTexts();

var _sizes = getMenuSizes();

draw_set_font(fMenu);

menu.render(_sizes.menuX, _sizes.menuY, 36, false, true, DEBUG);

textsDrawSetup(24, fa_left, fa_bottom);

draw_text(0, global.windowHeight, version);
