/// @function drawSetText(colour, font, halign, valign)
/// @param colour Text colour
/// @param font Text colour
/// @param halign Text horizontal alignment
/// @param valign Text vertical alignment
function drawSetText(colour, font, halign, valign){
	draw_set_color(colour);
	draw_set_font(font);
	draw_set_halign(halign);
	draw_set_valign(valign);
}

drawTextAndSpriteMap = ds_map_create();

function prepareDrawTextAndSprite(_arrayLength, _textAndSpriteArray) {
	var _preparedArray = [];
	var _xOffset = 0;
	
	var _fontHeight = string_height(" ");
	
	show_debug_message("prepareDrawTextAndSprite for array with length {0}", _arrayLength);
	
	for(var index = 0; index < _arrayLength; index++) {
		var _value = _textAndSpriteArray[index];
		
		var isSprite = is_handle(_value);
		
		show_debug_message("value[{0}]: [isString: {1}, isNum: {2}, isHandle: {3}]", index, is_string(_value), is_numeric(_value), is_handle(_value));
		
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

/// @function drawTextAndSprite(colour, font, halign, valign)
/// @param {string} key Key for the DS Map to store prepared text
/// @param {Array<String,Asset.GMSprite>}textAndSpriteArray Array containing text or sprite
/// @param {Real} x horizontal position
/// @param {Real} y vertical position
/// @param {Constant.Color} colour Text colour
/// @param {Asset.GMFont} font Text colour
/// @param {Constant.HAlign} halign Text horizontal alignment
/// @param {Constant.VAlign} valign Text vertical alignment
function drawTextAndSprite(key, textAndSpriteArray, x, y, colour, font, halign, valign) {
	draw_set_color(colour);
	draw_set_font(font);
	draw_set_halign(fa_left);
	draw_set_valign(valign);
	
	var _preparedArray = [];
	var _xOffset = 0;
	// var _sumWidth = 0;
	var _arrayLength = array_length(textAndSpriteArray);
	
	
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
	

	if(halign == fa_center) {
		_startX -= (_xOffset * 0.5);
	}
	
	if(halign == fa_right) {
		_startX -= _xOffset;
	}

	
	
	for(var index = 0; index < _arrayLength; index++) {
		var _value = _preparedArray[index];
		
		
		if (_value.type == "text")
		{
		

		    draw_text(_startX + _value.offset, y, _value.text);
						
			
		} else if(_value.type == "sprite") {
			
			// var _spaceWidth = string_width(" ") * 0.5;
			//_currentX += _spaceWidth;
			
			var _halfHeight = _value.height * 0.5;

			draw_sprite_stretched(_value.sprite, 0, _startX + _value.offset, y - _halfHeight, _value.width, _value.height);
						

		}
		
	}
}