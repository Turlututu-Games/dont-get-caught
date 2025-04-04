enum MenuTemplate {
	CENTER,
	RIGHT_DOWN,
}

/// @func Menu item options
/// @param {Array<Struct.Platforms>} _platforms List of plateforms. If empty, will be available to all
/// @param {Asset.GMSound} _sound List of plateforms. Sound to play when triggering
/// @param {Real} _selectedOpacity Opacity for selected item
/// @param {Real} _unselectedOpacity Opacity for unselected item
function MenuItemOptions(
	_platforms = [],
	_sound = sfxClickMenu,
	_selectedOpacity = 1.0,
	_unselectedOpacity = 0.7,
) constructor {
	platforms = _platforms;
	sound = _sound;
	selectedOpacity = _selectedOpacity;
	unselectedOpacity = _unselectedOpacity;
	halign = undefined;
	valign = undefined;
	offsetX = undefined;
	offsetY = undefined;
	minimalWidth = undefined;	
	doubleWidth = undefined;

}

/// @func Menu item
/// @param {String} _name The text for the option
/// @param {Function} _action The action to execute
/// @param {Struct.MenuItemOptions} _option Options for the item
function MenuItem(
	_name,
	_action = undefined,
	_option = new MenuItemOptions()
) constructor {
	name = _name;
	action = _action;
	option = _option;
}

/// @func Menu instance
/// @param {Array<Struct.MenuItem>} _options List of options
/// @param {Bool} _fromBottom Indicate that the menu is displayed from the bottom
function Menu(_options = [], _fromBottom = false) constructor {
	optionSelected = undefined;
	options = _options;
	filtered = false;
	overrideSize = undefined;
	fromBottom = _fromBottom;
	
	mouseX = 0;
	mouseY = 0;
	
	static step = function() {
		if (!self.filtered) {
			self.filter();
		}

		if (array_length(self.options) == 0) {
			return;
		}
		
		var _move = global.inputs.downMenu - global.inputs.upMenu;
		
		if(self.fromBottom) {
			_move = 0 - _move;	
		}
		
		if(self.optionSelected == undefined) {
			self.optionSelected = self.fromBottom ?  array_length(self.options) - 1 : 0;
		}

		self.optionSelected +=  _move;

		if (self.optionSelected >= array_length(self.options)) {
			self.optionSelected = 0;
		}

		if (self.optionSelected < 0) {
			self.optionSelected = array_length(self.options) - 1;
		}

		var _selected = self.options[self.optionSelected];

		if (global.inputs.downMenu || global.inputs.upMenu) {
			playSound(_selected.option.sound, 0.3);
		}
	};

	/// @func Menu Render
	/// @param {Real} _startX The horizontal starting position
	/// @param {Real} _startY The vertical starting position
	/// @param {Real} _size The font size to use
	/// @param {Bool} [_shadow] display shadow under the text ? (default: false)
	/// @param {Bool} [_enableMouse] Allow mouse to navigate ? (default: true)
	/// @param {Bool} [_enableBox] If mouse is allowed, display a bounding box on items ? (default: false)
	/// @param {Bool} [_cursors] Display cursor before and after selected option ? (default: true)
	/// @param {Constant.Color} [_color] Font color (default: c_white)
	/// @param {Asset.GMSprite} [_sprite] Display a sprite under menu item ? (default: undefined)
	static render = function(_startX, _startY, _size, _shadow = false, _enableMouse = true, _enableBox = false, _cursors = true, _color = c_white, _sprite = undefined) {
		if (!self.filtered) {
			self.filter();
		}
				
		var _initial_valign = draw_get_valign();
		var _initial_halign = draw_get_halign();	
		var _mousePointDisabled = false;
		
		var _newMouseX = window_mouse_get_x();
		var _newMouseY = window_mouse_get_y();
		
			if(_newMouseX == self.mouseX && _newMouseY == self.mouseY) {
				// Mouse don't moved, bypass the next checks
				_mousePointDisabled = true;
			}
			
			self.mouseY = _newMouseY;
			self.mouseX = _newMouseX;

		for (var _i = 0; _i < array_length(self.options); _i++) {
			var _print = "";
			var _current = self.options[_i];
			var _opacity = 1.0;
			var _name = translate(_current.name);

			if (_i == self.optionSelected) {
				if(_cursors) {
					_print += "> " + _name + " <";
				} else {
					_print += _name;
				}
				_opacity = _current.option.selectedOpacity;
			} else {
				_print += _name;
				_opacity = _current.option.unselectedOpacity;
			}
			
			var _offsetPositionY = self.fromBottom ? 0 -  (_i * _size) :  (_i * _size);
			var _offset_x = _startX;
			var _offset_y = _startY + _offsetPositionY;
			
			if(_current.option.offsetX) {
				_offset_x += _current.option.offsetX;	
			}
			
			if(_current.option.offsetY) {
				_offset_y += _current.option.offsetY;	
			}	
			
			if(_current.option.halign != undefined) {
				draw_set_halign(_current.option.halign);
			} else {
				draw_set_halign(_initial_halign);
			}
			
			if(_current.option.valign != undefined) {
				draw_set_valign(_current.option.valign);
			} else {
				draw_set_valign(_initial_valign);
			}				
			
			var _params = {};
		
			
			if(_enableMouse || _sprite) {
				_params = self.boundingBox(_offset_x, _offset_y, _size, _print, _current.option.doubleWidth, _current.option.minimalWidth);
			}
			
			if(_enableMouse) {					
				self.mouse(_newMouseX, _newMouseY, _params, _i, _enableBox, _mousePointDisabled);
			}
			
			if(_sprite) {
				self.drawSprite(_params, _i, _sprite);
			}


			

			if (_shadow) {
				//draw_set_alpha(_opacity - 0.3);

				//draw_set_color(c_black);
				//draw_text(_offset_x, _offset_y + 8, _print);
				_drawTextGUIInternal(global.windowSizeRatio, _offset_x, _offset_y + 8, _print, c_black, undefined, undefined, undefined, undefined, _opacity - 0.3);
			}
			
			_drawTextGUIInternal(global.windowSizeRatio, _offset_x, _offset_y, _print, _color, undefined, undefined, undefined, _opacity);

			//draw_set_alpha(_opacity);
			//draw_set_color(_color);
			
			var _offset_text_y = _offset_y;
			
			//if(_yOffsets) {
				//_offset_text_y += (_i == self.optionSelected) ? _yOffsets[0] : _yOffsets[1];
			//}

			//draw_text(_offset_x, _offset_y, _print);
			// draw_set_alpha(1.0);
		}

	};

	static execute = function() {
		if(array_length(self.options) > 0) {
			var _selected = self.options[self.optionSelected];

			if (_selected.action != undefined) {
				_selected.action();
			}

			playSound(_selected.option.sound, 1);
		}
	};

	static boundingBox = function(_startX, _offset_y, _size, _print, _doubleWidth = false, _minimalWidth = 0) {

			var _ratio = global.windowSizeRatio;
			var _width = max(_minimalWidth, string_width(_print)) * _ratio;
			var _height = string_height(_print) * _ratio;
			
			var _halign = draw_get_halign();
			var _valign = draw_get_valign();


			var _x1 = _startX;
			var _x2 = _startX;
			var _y1 = _offset_y;
			var _y2 = _offset_y;

			switch (_halign) {
				case fa_left:
					_x2 += _width;
					if(_doubleWidth) {
						_x1 -= _width;	
					}
					break;
				case fa_center:
					_x1 -= (_width * 0.5) * (_doubleWidth ? 2 : 1);
					_x2 += (_width * 0.5) * (_doubleWidth ? 2 : 1);
					break;
				case fa_right:
					_x1 -= _width;
					if(_doubleWidth) {
						_x2 += _width;	
					}
					
			}

			switch (_valign) {
				case fa_top:
					_y2 += _height;
					break;
				case fa_middle:
					_y1 -= _height * 0.5;
					_y2 += _height * 0.5;
					break;
				case fa_bottom:
					_y1 -= _height;
					break;
			}

			// show_debug_message({_halign, _valign});
			var _rectange_offset = _size / 10;
			_x1 -= _rectange_offset;
			_y1 -= _rectange_offset;
			_x2 += _rectange_offset;
			_y2 += _rectange_offset;

			return { x1: _x1, x2: _x2, y1: _y1, y2: _y2 }
		
	};
	

	static mouse = function(_mouseX, _mouseY, _params, _index, _enableBox, _mousePointDisabled) {
		
			global.mouseCursor = true;
			
			var _x1 = _params.x1;
			var _x2 = _params.x2;
			var _y1 = _params.y1;
			var _y2 = _params.y2;


			if(_enableBox) {
				draw_set_color(c_black);
				draw_rectangle(_x1, _y1, _x2, _y2, true);
			}

		



			if (point_in_rectangle(_mouseX, _mouseY, _x1, _y1, _x2, _y2)) {
				
		
				
				if(!_mousePointDisabled) {
									
					if(self.optionSelected != _index) {
						self.optionSelected = _index;
						var _selected = self.options[self.optionSelected];

						playSound(_selected.option.sound, 0.3);
					}
				}
				
				if(global.inputs.clickMenu) {
					self.execute();
					if(global.pause) {
						global.pause = false; // Ensure pause is removed
					}
				}
				
			}

		
	};
	
	/// @func Draw sprite
	/// @param {Struct} _params
	/// @param {Real} _index
	/// @param {Asset.GMSprite} _sprite
	static drawSprite = function(_params, _index, _sprite) {
		
			var _x1 = _params.x1;
			var _x2 = _params.x2;
			var _y1 = _params.y1;
			var _y2 = _params.y2;
			
			var _imageIndex = self.optionSelected = _index ? 1 : 0

		
			draw_sprite_stretched(
				_sprite,
				_imageIndex, 
				_x1,
				_y1,
				_x2 - _x1,
				_y2 - _y1
			);
	
		
	};
		

	static filter = function() {
		var _newOptions = [];
		/// @param {Struct.MenuItem} _element Item element

		for (
			var _optionsIndex = 0;
			_optionsIndex < array_length(self.options);
			_optionsIndex++
		) {
			var _element = self.options[_optionsIndex];

			var _len = array_length(_element.option.platforms);

			if (_len == 0) {
				array_push(_newOptions, _element);
			} else {
				var _include = false;
				for (var _platformIndex = 0; _platformIndex < _len; _platformIndex++) {
					var _platform = _element.option.platforms[_platformIndex];

					if (_platform == Platforms.DESKTOP) {
						if (
							global.platform == Platforms.LINUX
							|| global.platform == Platforms.WINDOWS
							|| global.platform == Platforms.OSX
						) {
							_include = true;
						}
					} else if (_platform == Platforms.MOBILE) {
						if (
							global.platform == Platforms.ANDROID
							|| global.platform == Platforms.IOS
							|| global.platform == Platforms.APPLE_TV
						) {
							_include = true;
						}
					} else if (_platform == Platforms.BROWSERS) {
						if (
							global.platform == Platforms.BROWSER
							|| global.platform == Platforms.GX
						) {
							_include = true;
						}
					} else if (global.platform == _platform) {
						_include = true;
					}
				}

				if (_include) {
					array_push(_newOptions, _element);
				}
			}
		}

		self.options = _newOptions;
		self.filtered = true;
	};
}

/// @func renderMenu(_menu, _startX, _startY, _size, [_shadow], [_enableMouse], [_enableBox], [_fromBottom], [_cursors], [_color], [_sprite])
/// @param {Struct.Menu} _menu Menu to render
/// @param {Real} _startX The horizontal starting position
/// @param {Real} _startY The vertical starting position
/// @param {Real} _size The font size to use
/// @param {Bool} [_shadow] display shadow under the text ? (default: false)
/// @param {Bool} [_enableMouse] Allow mouse to navigate ? (default: true)
/// @param {Bool} [_enableBox] If mouse is allowed, display a bounding box on items ? (default: false)
/// @param {Bool} [_fromBottom] If enabled, draw the menu from the bottom instead of the top
/// @param {Bool} [_cursors] Display cursor before and after selected option ? (default: true)
/// @param {Constant.Color} [_color] Font color (default: c_white)
/// @param {Asset.GMSprite} [_sprite] Display a sprite under menu item ? (default: undefined)
function renderMenu(_menu, _startX, _startY, _size, _shadow = false, _enableMouse = true, _enableBox = DEBUG, _fromBottom = false, _cursors = true, _color = c_white, _sprite = undefined) {
	_menu.fromBottom = _fromBottom;
	_menu.render(_startX, _startY, _size, _shadow, _enableMouse, _enableBox, _cursors, _color, _sprite);
}

function renderMenuTemplate(_menu, _template) {
	switch(_template) {
		case MenuTemplate.CENTER:
			draw_set_font(fMenu48);
			renderMenu(_menu, global.windowWidth * 0.5, global.windowHeight * 0.5, 48*2* global.windowSizeRatio);
			break;
		case MenuTemplate.RIGHT_DOWN:
			draw_set_font(fMenu);
			renderMenu(_menu, global.windowRightGUIMargin, global.windowDownGUIMargin,36 * global.windowSizeRatio ,false, true, DEBUG, true);
			break;			
	}
}
