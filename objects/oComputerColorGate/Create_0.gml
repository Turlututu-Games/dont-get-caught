event_inherited();

// initialSprite = sprite_index;



function useComputer() {
	if(!used) {
		with(oPlayer) {
			
			var _color = translate(other._messageColor);
			var _colorUcFirst = capitalizeFirstLetter(_color);
			
			var _keyIndex = ds_list_find_index(inventory, other._key);
			
			if(_keyIndex != -1) {
				openGate(other, other._gateObject, _colorUcFirst);	
				ds_list_delete(inventory, _keyIndex);
			} else {
				noKey(_colorUcFirst);
			}
		}
	}
}

