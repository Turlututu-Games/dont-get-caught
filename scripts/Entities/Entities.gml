/// @desc dropItems(x,y,randomness,[items])
/// @arg _x
/// @arg _y
/// @arg _randomness Variance amount in repartition (0 to 1)
/// @arg {Array} [items] array of items to drop
function dropItems(_x,_y, _randomness, items) {
	
	var _itemsLength = array_length(items);
	
	//if(_itemsLength) {
	var _anglePerItem = 360/_itemsLength;
	var _angleRandomness = clamp(_anglePerItem * _randomness, 0, 1);
	var _angle = random(360);
		
	for(var _i = 0; _i < _itemsLength; _i++) {
		with(instance_create_layer(_x, _y, PLAYER_LAYER, items[_i])) {
			direction = _angle;
			spd = 0.75 + (_itemsLength * 0.1) + random(0.1);
		}
			
		_angle += (_anglePerItem + random_range(0-_angleRandomness, _angleRandomness));
	}
	//} else {
	//	instance_create_layer(_x, _y, INSTANCES_MAP, items[0]);
	//}
}