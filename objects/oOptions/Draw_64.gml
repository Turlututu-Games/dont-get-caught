resetTexts();
// draw_set_font(fProsto24);
// draw_set_color(c_black);

var _startX = global.windowWidth * 0.5;
var _titleY = global.windowHeight * 0.3;
var _size = 58 //* global.windowSizeRatio; // 48;
var _startY = _titleY + _size;


drawTextGUITemplate(_startX, _titleY, "Options", TextTemplate.SUB_MENU_TITLE);

// draw_set_halign(fa_right);
renderMenu(
	menu,
	_startX/* - 20*/,
	_startY,
	_size, // size
	false, // shadow
	true, // mouse
	DEBUG, // box
	false, // fromBottom
	false // cursor
);
draw_set_halign(fa_left);

for (var _i = 0; _i < array_length(displayOptions); _i++) {

			var _current = displayOptions[_i];
			var _opacity = 1.0;
			
			var _optionValue = _current[0]();
			
			 if(is_bool(_optionValue)) {
				 _optionValue = _optionValue ? 1 : 0;
			 }
			
			var _print = "";
			
			if(is_string(_optionValue)) {
				_print = translate(struct_get(_current[1], _optionValue));
			} else {
				_print = translate(_current[1][_optionValue]);
			}

			if (_i == menu.optionSelected) {
				_opacity = 1;
			} else {
				_opacity = 0.7;
			}
			
			var _offsetY = _startY + (_i * _size);
			
			//draw_set_alpha(_opacity);
			//draw_set_color(c_black);

			drawTextGUI(_startX + 20, _offsetY, _print, TextColor.LIGHT, TextSize.TEXT, TextAlign.LEFT, false, _opacity);
			//draw_text(_startX + 20, _offsetY, _print);
			//draw_set_alpha(1.0);
		}