/// @description Key pickup

/* var _instancesNumber = instance_number(oDoorGreen);
var _instances = [];

for (var i = 0; i < _instancesNumber; ++i;)
{
	_instances[i] = instance_find(oDoorGreen, i);
}

for (var i = 0; i < _instancesNumber; ++i;)
{
	instance_destroy(_instances[i]);
}*/

playSound(sfxClickMenu);
instance_destroy();

with(oPlayer) {
	ds_list_add(inventory, "greenKey");
}