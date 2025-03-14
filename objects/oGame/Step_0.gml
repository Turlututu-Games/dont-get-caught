//var _key_f = keyboard_check(ord("F"));
//var _key_control = keyboard_check(vk_control);
//var _key_f_with_control = keyboard_check(6);

//show_debug_message("F key state: " + string(_key_f));
//show_debug_message("Ctrl key state: " + string(_key_control));
//show_debug_message("F key state with control: " + string(_key_f_with_control));
// show_debug_message("key: " + string(keyboard_key));

/*if(cooldownCommand > 0) {
	cooldownCommand--;	
}

if(cooldownCommand == 0) {
	if(_key_f && _key_control) {
		var isFullscreen = window_get_fullscreen();
		window_set_fullscreen(!isFullscreen);
		cooldownCommand = 30;
	}
}*/

steam_update();

if(global.mouseCursor != cursorDisplayed) {
	cursor_sprite = global.mouseCursor ? cr_arrow : cr_none;
	cursorDisplayed = global.mouseCursor;
	show_debug_message("Switching cursor : {0}", global.mouseCursor);
}
