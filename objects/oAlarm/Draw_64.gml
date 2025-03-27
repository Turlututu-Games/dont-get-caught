var _displayAlarm = false;
var _displayOverlay = false;

if(global.gameOptions.detectionTimer) {
	_displayAlarm = started;	
	_displayOverlay = true;
} else {
	_displayAlarm = alarmTimer != alarmTimerInitial;
}

//addDebugVariable("alarmTimer", alarmTimer);
//addDebugVariable("alarmTimerInitial", alarmTimerInitial);



	var _mainWidth = global.windowWidth / 1.333333333;
	var _mainHeight = global.windowHeight;
	
	var _sideWidth = global.windowWidth / 4; // This GUI element is twice the size
	var _sideHeight = global.windowHeight / 6;	

addDebugVariable("_sideWidth", _sideWidth);
addDebugVariable("_sideHeight", _sideHeight);

	//var _sideWidth = 100;
	//var _sideHeight = 100;

	//var _barHeight = _mainHeight / 18.75;
	//var _offsetText = _mainWidth / 30;


	var percent = 1 - alarmTimer / alarmTimerInitial;
	
	//3b3b3b
	draw_set_color($3b3b3b);
	draw_rectangle(_mainWidth, _mainHeight - _sideHeight, _mainWidth + _sideWidth, _mainHeight, false);
	
	if(_displayOverlay) {
	draw_set_color(c_red);
	draw_rectangle(
		_mainWidth, 
		_mainHeight - _sideHeight, 
		_mainWidth + (_sideWidth * percent), 
		_mainHeight, 
		false
	);
	
	draw_sprite_stretched(sDangerOverlay, 0, _mainWidth, _mainHeight - _sideHeight, _sideWidth, _sideHeight);


	// draw_sprite_part_ext
	
	// draw_sprite_stretched(sCameraOverlaySmall, animationFrame, drawX, drawY, 100, 100);
	/*draw_sprite_part_ext(
		sDangerOverlay, // sprice
		0, // subimg
		0, // left
		0, // top
		percent * _sideWidth, // width
		_sideHeight, // height
		_mainWidth, // x
		_mainHeight - _sideHeight, // y
		global.windowSizeRatio,
		global.windowSizeRatio,
		c_white,
		1
	);*/
	


		/*drawTextGUITemplate(
			_mainWidth + _offsetText, // x
			_mainHeight - _barHeight, // y
			translate("cameraDetection"),
			TextTemplate.STANDARD
		)*/
	}
