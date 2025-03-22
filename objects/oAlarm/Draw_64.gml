
var _mainWidth = global.windowWidth / 1.333333333;
var _mainHeight = global.windowHeight;

//var _sideWidth = 100;
//var _sideHeight = 100;

var _barHeight = _mainHeight / 18.75;
var _offsetText = _mainWidth / 30;


var percent = 1 - alarmTimer / alarmTimerInitial;

// draw_sprite_stretched(sCameraOverlaySmall, animationFrame, drawX, drawY, 100, 100);
draw_sprite_part(
	sAlarm, // sprice
	0, // subimg
	0, // left
	0, // top
	percent * (_mainWidth / 4), // width
	_barHeight, // height
	_mainWidth, // x
	_mainHeight - _barHeight // y
);

drawSetText(c_white, fMenu, fa_left, fa_bottom);
if(started) {
	draw_text(
		_mainWidth + _offsetText, // x
		_mainHeight - _barHeight, // y
		"Detection"
	);
}