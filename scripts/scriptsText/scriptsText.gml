drawTextAndSpriteMap = ds_map_create();

enum TextColor {
	LIGHT,
	DARK
}

enum TextSize {
	TEXT,
	MAIN_LABEL,
	LARGE_LABEL,
	TITLE
}

enum TextAlign {
	CENTER,
	TOP_LEFT,
	TOP,
	TOP_RIGHT,
	LEFT,
	RIGHT,
	BOTTOM_LEFT,
	BOTTOM,
	BOTTOM_RIGHT,
}

enum TextTemplate {
	STANDARD, //: c_white, fMenu, fa_left, fa_bottom, 1
	STANDARD_SHADOW, //: c_white, fMenu, fa_left, fa_bottom, 1
	SUB_MENU_TITLE, //: c_white, fMenu, fa_left, fa_bottom, 1
	MENU_TITLE //: c_white, fMenu72, fa_center, fa_middle, 1	
}

/// @function textAlignToAlign(align, fallback)
/// @param {Struct.TextAlign} align
function textAlignToAlign(align, fallback = [undefined, undefined]) {
	switch(align) {
		case TextAlign.BOTTOM: return [fa_center, fa_bottom];
		case TextAlign.BOTTOM_LEFT: return [fa_left, fa_bottom];
		case TextAlign.BOTTOM_RIGHT: return [fa_right, fa_bottom];
		case TextAlign.CENTER: return [fa_center, fa_middle];
		case TextAlign.LEFT: return [fa_left, fa_middle];
		case TextAlign.RIGHT: return [fa_right, fa_middle];
		case TextAlign.TOP: return [fa_center, fa_top];
		case TextAlign.TOP_LEFT: return [fa_left, fa_top];
		case TextAlign.TOP_RIGHT: return [fa_right, fa_top];
		default: return fallback;
	}
}

/// @function textColorToColor(color)
/// @param {Struct.TextColor} color
function textColorToColor(color) {
	switch(color) {
		case TextColor.DARK: return c_black;
		case TextColor.LIGHT: return c_white;
		default: return undefined;
	}
}

/// @function textSizeToFont(size)
/// @param {Struct.TextSize} size
function textSizeToFont(size) {
	switch(size) {
		case TextSize.TEXT: return fMenu;
		case TextSize.MAIN_LABEL: return fMenu28;
		case TextSize.LARGE_LABEL: return fMenu48;
		case TextSize.TITLE: return fMenu72;
		default: return undefined;
	}
}


/// @function drawSetText(colour, font, halign, valign)
/// @param {Constant.Color} colour Text colour
/// @param {Asset.GMFont} font Text colour
/// @param {Constant.HAlign} halign Text horizontal alignment
/// @param {Constant.VAlign} valign Text vertical alignment
/// @param {Real} [alpha] Text alpha
function drawSetText(colour, font, halign, valign, alpha){
	draw_set_color(colour);
	draw_set_font(font);
	draw_set_halign(halign);
	draw_set_valign(valign);
	if(alpha != undefined) {
		draw_set_alpha(alpha)
	}
	
}

/// @function _drawTextGUIInternal(ratio, x, y, text, [colour], [font], [halign], [valign], [alpha], [angle])
/// @param {Real} ratio The display ratio
/// @param {Real} x Horizontal position
/// @param {Real} y Vertical position
/// @param {String} text Text to display
/// @param {Constant.Color,Undefined} [colour] Text colour
/// @param {Asset.GMFont,Undefined} [font] Text font
/// @param {Constant.HAlign,Undefined} [halign] Text horizontal alignment
/// @param {Constant.VAlign,Undefined} [valign] Text vertical alignment
/// @param {Real,Undefined} [alpha] Text alpha
/// @param {Real,Undefined} [angle] Text angle
function _drawTextGUIInternal(ratio, x, y, text, colour, font, halign, valign, alpha, angle = 0) {
	
	var _initialColour = undefined;
	var _initialFont = undefined;
	var _initialHAlign = undefined;
	var _initialVAlign = undefined;
	var _initialAlpha = undefined;
			
	if(colour != undefined) {
		_initialColour = draw_get_color();
		if(_initialColour != colour) {
			draw_set_color(colour);
		} else {
			_initialColour = undefined;
		}
	}
	
	if(font != undefined) {
		_initialFont = draw_get_font();
		if(_initialFont != font) {
			draw_set_font(font);
		} else {
			_initialFont = undefined;
		}
	}
	
	if(halign != undefined) {
		_initialHAlign = draw_get_halign();
		if(_initialHAlign != halign) {
			draw_set_halign(halign);
		} else {
			_initialHAlign = undefined;
		}
	}
	
	if(valign != undefined) {
		_initialVAlign = draw_get_valign();
		if(_initialVAlign != valign) {
			draw_set_valign(valign);
		} else {
			_initialVAlign = undefined;
		}
	}
	
	if(alpha != undefined) {
		_initialAlpha = draw_get_alpha();
		if(_initialAlpha != alpha) {
			draw_set_alpha(alpha);
		} else {
			_initialAlpha = undefined;
		}
	}
	
	draw_text_transformed(x, y, text, ratio, ratio, angle);
	
	if(_initialColour != undefined) {
		draw_set_color(_initialColour);
	}
	
	if(_initialFont != undefined) {
		draw_set_font(_initialFont);
	}
	
	if(_initialHAlign != undefined) {
		draw_set_halign(_initialHAlign);
	}
	
	if(_initialVAlign != undefined) {
		draw_set_valign(_initialVAlign);
	}
	
	if(_initialAlpha != undefined) {
		draw_set_alpha(_initialAlpha);
	}
	
}

/// @function drawTextGUI(x, y, text, [colour], [size], [align], [shadow], [alpha], [angle])
/// @param {Real} x Horizontal position
/// @param {Real} y Vertical position
/// @param {String,Real} text Text to display
/// @param {Struct.TextColor,Undefined} [colour] Text colour
/// @param {Struct.TextSize,Undefined} [size] Text size
/// @param {Struct.TextAlign,Undefined} [align] Text alignment
/// @param {Bool,Undefined} [shadow] Text shadow
/// @param {Real,Undefined} [alpha] Text alpha
/// @param {Real,Undefined} [angle] Text angle
function drawTextGUI(x, y, text, colour = undefined, size = undefined, align = undefined, shadow = false, alpha = 1, angle = 0) {
	var resolvedAlign = textAlignToAlign(align);
	var _resolveColor = textColorToColor(colour);
	var _resolveFont = textSizeToFont(size);
	
	var _text = is_string(text) ? text : getTranslationKey(text);
	
	if(shadow) {
		var _resolveColorShadow = textColorToColor(TextColor.DARK);
		_drawTextGUIInternal(global.windowSizeRatio, x, y, _text, _resolveColorShadow, _resolveFont, resolvedAlign[0], resolvedAlign[1], alpha - 0.3, angle);
	}
	
	_drawTextGUIInternal(global.windowSizeRatio, x, y, _text, _resolveColor, _resolveFont, resolvedAlign[0], resolvedAlign[1], alpha, angle);
}

/// @function drawTextGUITemplate(x, y, text, template)
/// @param {Real} x Horizontal position
/// @param {Real} y Vertical position
/// @param {String,Real} text Text to display
/// @param {Struct.TextTemplate} template Text template
function drawTextGUITemplate(x, y, text, template) {
	switch(template) {
		case TextTemplate.MENU_TITLE:
			drawTextGUI(x, y, text, TextColor.LIGHT, TextSize.TITLE, TextAlign.CENTER, false, 1, 0);
			break;
			
		case TextTemplate.SUB_MENU_TITLE:
			drawTextGUI(x, y, text, TextColor.LIGHT, TextSize.LARGE_LABEL, TextAlign.CENTER, false, 1, 0);
			break;			
			
		case TextTemplate.STANDARD_SHADOW:
			drawTextGUI(x, y, text, TextColor.LIGHT, TextSize.TEXT, TextAlign.BOTTOM_LEFT, true, 1, 0);
			break;
		case TextTemplate.STANDARD:
		default:
			drawTextGUI(x, y, text, TextColor.LIGHT, TextSize.TEXT, TextAlign.BOTTOM_LEFT, false, 1, 0);
			break;
	}
}

/// @function drawTextInGame(x, y, text, [colour], [size], [align], [shadow], [alpha], [angle])
/// @param {Real} x Horizontal position
/// @param {Real} y Vertical position
/// @param {String,Real} text Text to display
/// @param {Struct.TextColor,Undefined} [colour] Text colour
/// @param {Struct.TextSize,Undefined} [size] Text size
/// @param {Struct.TextAlign,Undefined} [align] Text alignment
/// @param {Bool,Undefined} [shadow] Text shadow
/// @param {Real,Undefined} [alpha] Text alpha
/// @param {Real,Undefined} [angle] Text angle
function drawTextInGame(x, y, text, colour = undefined, size = undefined, align = undefined, shadow = false, alpha = 1, angle = 0) {
	var resolvedAlign = textAlignToAlign(align);
	var _resolveColor = textColorToColor(colour);
	var _resolveFont = textSizeToFont(size);
		
	if(shadow) {
		var _resolveColorShadow = textColorToColor(TextColor.DARK);
		_drawTextGUIInternal(1, x, y, text, _resolveColorShadow, _resolveFont, resolvedAlign[0], resolvedAlign[1], alpha - 0.3, angle);
	}
	
	_drawTextGUIInternal(1, x, y, text, _resolveColor, _resolveFont, resolvedAlign[0], resolvedAlign[1], alpha, angle);
}



function prepareDrawTextAndSprite(_arrayLength, _textAndSpriteArray) {
	var _preparedArray = [];
	var _xOffset = 0;
	
	var _fontHeight = string_height(" ");
	
	show_debug_message("prepareDrawTextAndSprite for array with length {0}", _arrayLength);
	
	for(var index = 0; index < _arrayLength; index++) {
		var _value = _textAndSpriteArray[index];
		
		var isSprite = is_handle(_value);
		
		// show_debug_message("value[{0}]: [isString: {1}, isNum: {2}, isHandle: {3}]", index, is_string(_value), is_numeric(_value), is_handle(_value));
		
		if (is_string(_value))
		{
			// var _valueWithSpace = index == _arrayLength - 1 ? _value : _value + " ";
			var _translated = translate(_value);
			var _stringWidth =  string_width(_translated);
			
			array_push(_preparedArray, { type: "text", text: _translated, width: _stringWidth, offset: _xOffset });
			
			_xOffset += _stringWidth;
			isSprite = false;
		} else if(is_numeric(_value) && !isSprite) {
			var _sprite = getInputsSprite(_value);
			if(_sprite != undefined) {
				_value = _sprite;
				isSprite = true;
			}
		}
		
		
		if(isSprite) {
			
			// var _spaceWidth = string_width(" ") * 0.5;
			//_currentX += _spaceWidth;
			var _spriteWidthRaw = sprite_get_width(_value);
			var _spriteHeightRaw = sprite_get_height(_value);
			
			var _ratio = (_fontHeight / _spriteHeightRaw) * 0.75;
						
			var _spriteWidth = _spriteWidthRaw * _ratio;
			var _spriteHeight = _spriteHeightRaw * _ratio;
			
			var _halfWidth = 0; // _spriteWidth * 0.5

			
			array_push(_preparedArray, { type: "sprite", sprite: _value, width: _spriteWidth, height: _spriteHeight, offset: _xOffset + _halfWidth });
			
			_xOffset += _spriteWidth + _halfWidth;
			//_currentX += _spaceWidth;
		}
		
	}
	
	return {
		preparedArray: _preparedArray,
		xOffset: _xOffset
	}
}

/// @function drawTextAndSprite(key, textAndSpriteArray, x, y, colour, font, halign, valign)
/// @param {String} key Key for the DS Map to store prepared text
/// @param {Array<String,Real,Asset.GMSprite>}textAndSpriteArray Array containing text or sprite
/// @param {Real} x horizontal position
/// @param {Real} y vertical position
/// @param {Struct.TextColor} colour Text colour
/// @param {Struct.TextSize} size Text size
/// @param {Struct.TextAlign} align Text alignment
function drawTextAndSprite(key, textAndSpriteArray, x, y, colour, size, align) {
	var _resolvedAlign = textAlignToAlign(align, [fa_center, fa_middle]);
	var _resolveColor = textColorToColor(colour);
	var _resolveFont = textSizeToFont(size);
	
	draw_set_color(_resolveColor);
	draw_set_font(_resolveFont);
	draw_set_halign(fa_left);
	draw_set_valign(_resolvedAlign[1]);
	
	var _preparedArray = [];
	var _xOffset = 0;
	// var _sumWidth = 0;
	var _arrayLength = array_length(textAndSpriteArray);
	
	//show_debug_message("key: {0}, x: {1}, y: {2}", key, x, y);
	
	
	if(!ds_map_exists(global.drawTextAndSpriteMap, key)) {
		var _entry = prepareDrawTextAndSprite(_arrayLength, textAndSpriteArray);
		ds_map_add(global.drawTextAndSpriteMap, key, _entry);
		_preparedArray = _entry.preparedArray;
		_xOffset = _entry.xOffset;
	} else {
		var _entry = ds_map_find_value(global.drawTextAndSpriteMap, key);
		_preparedArray = _entry.preparedArray;
		_xOffset = _entry.xOffset;	
	}
	
	
	var _startX = x;
	

	if(_resolvedAlign[0] == fa_center) {
		_startX -= (_xOffset * 0.5);
	}
	
	if(_resolvedAlign[0] == fa_right) {
		_startX -= _xOffset;
	}

	
	
	for(var index = 0; index < _arrayLength; index++) {
		var _value = _preparedArray[index];
		
		
		if (_value.type == "text")
		{
		
			// In-Game text
		    draw_text(_startX + _value.offset, y, _value.text);
						
			
		} else if(_value.type == "sprite") {
			
			// var _spaceWidth = string_width(" ") * 0.5;
			//_currentX += _spaceWidth;
			
			var _halfHeight = _value.height * 0.5;

			draw_sprite_stretched(_value.sprite, 0, _startX + _value.offset, y - _halfHeight, _value.width, _value.height);
						

		}
		
	}
}

function capitalizeFirstLetter(text) {
	var _first = string_upper(string_copy(text, 1, 1));
	var _rest = string_copy(text,2,string_length(text));
	return $"{_first}{_rest}";
}


function displayMessage(msg) {
	if(!instance_exists(oFloatingTextBox)) {
		with(instance_create_layer(x, y - 64, layer, oFloatingTextBox)) {
			text = msg;
			length = string_length(msg);
			
			//_inputs = [msg];
			//_align = TextAlign.CENTER;
		}
	}
}