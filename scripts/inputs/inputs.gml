gamepads = [];
gamepadMain = undefined;


/// @func getInputs() Get input aliased, to allow multiple keybind, gamepad, etc
function getInputs(){
	var _keyLeft = keyboard_check(vk_left) || keyboard_check(ord("A"));
	var _keyRight = keyboard_check(vk_right) || keyboard_check(ord("D"));
	var _keyUp = keyboard_check(vk_up) || keyboard_check(ord("W"));
	var _keyDown = keyboard_check(vk_down) || keyboard_check(ord("S"));
	
	// We check for classic press and for _pressed state. Pressed state is true only on the frame it was pressed
	var _keyLeftPressed = keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A"));
	var _keyRightPressed = keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D"));
	var _keyUpPressed = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
	var _keyDownPressed = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
	
	var _keyRestart = keyboard_check_pressed(ord("R"));	
	var _keyPause = keyboard_check_pressed(vk_escape) || keyboard_check_pressed(vk_pause);

	var _keyJump = keyboard_check_pressed(vk_space);
	var _keyUse = keyboard_check_pressed(ord("E")) || keyboard_check_pressed(vk_enter);
	
	var _keyNextCamera = keyboard_check_pressed(vk_shift) || keyboard_check_pressed(vk_rshift);// || mouse_check_button_pressed(mb_left);
	var _keyPreviousCamera = keyboard_check_pressed(vk_control) || keyboard_check_pressed(vk_rcontrol);// || mouse_check_button_pressed(mb_right);
	
	var _keyValidateMenu = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space);
	var _keyClickMenu = mouse_check_button_pressed(mb_left);
	
	if(global.gamepadMain != undefined) {
		_keyLeft = _keyLeft || gamepad_button_check(global.gamepadMain, gp_padl);
		_keyRight = _keyRight || gamepad_button_check(global.gamepadMain, gp_padr);
		_keyUp = _keyUp || gamepad_button_check(global.gamepadMain, gp_padu);
		_keyDown = _keyDown || gamepad_button_check(global.gamepadMain, gp_padd);
		
		_keyLeftPressed = _keyLeftPressed || gamepad_button_check_pressed(global.gamepadMain, gp_padl);
		_keyRightPressed = _keyRightPressed || gamepad_button_check_pressed(global.gamepadMain, gp_padr);
		_keyUpPressed = _keyUpPressed || gamepad_button_check_pressed(global.gamepadMain, gp_padu);
		_keyDownPressed = _keyDownPressed || gamepad_button_check_pressed(global.gamepadMain, gp_padd);
		
		_keyRestart = _keyRestart || gamepad_button_check_pressed(global.gamepadMain, gp_select);		
		_keyPause = _keyPause || gamepad_button_check_pressed(global.gamepadMain, gp_start);		
		
		_keyJump = _keyJump || gamepad_button_check(global.gamepadMain, gp_face1) || gamepad_button_check(global.gamepadMain, gp_face3);
		_keyUse = _keyUse || gamepad_button_check(global.gamepadMain, gp_face2) || gamepad_button_check(global.gamepadMain, gp_face2);


		_keyNextCamera = _keyNextCamera || gamepad_button_check_pressed(global.gamepadMain, gp_shoulderr) || gamepad_button_check_pressed(global.gamepadMain, gp_shoulderrb);
		_keyPreviousCamera = _keyPreviousCamera || gamepad_button_check_pressed(global.gamepadMain, gp_shoulderl) || gamepad_button_check_pressed(global.gamepadMain, gp_shoulderlb);
		
		_keyValidateMenu = _keyValidateMenu 
			|| gamepad_button_check(global.gamepadMain, gp_start)
			|| gamepad_button_check(global.gamepadMain, gp_face1) || gamepad_button_check(global.gamepadMain, gp_face3);
	}
	
	var _keyUpMenu = _keyUpPressed || mouse_wheel_up();
	var _keyDownMenu = _keyDownPressed || mouse_wheel_down()

	
	return {
		left: _keyLeft, 
		leftPressed: _keyLeftPressed,
		right: _keyRight,		
		rightPressed: _keyRightPressed,
		up: _keyUp,		
		upPressed: _keyUpPressed,		
		upMenu: _keyUpMenu, // Special action only for menu
		down: _keyDown,		
		downPressed: _keyDownPressed,
		downMenu: _keyDownMenu, // Special action only for menu
		
		jump: _keyJump,
		use: _keyUse,	
		
		nextCamera: _keyNextCamera,		
		previousCamera: _keyPreviousCamera,

		restart: _keyRestart,
		pause: _keyPause,
		
		validateMenu: _keyValidateMenu,
		clickMenu: _keyClickMenu,
	};
}

function getAllInputsSprite() {
	
		var _left = sKeyboardA;
		var _right = sKeyboardD;
		var _up = sKeyboardW;	
		var _upMenu = sKeyboardW;
		var _down = sKeyboardS;		
		var _downMenu = sKeyboardS;
		var _jump = sKeyboardSpace;
		var _use = sKeyboardE;	
		var _nextCamera = sKeyboardShift;		
		var _previousCamera = skeyboardCtrl;
		var _restart = sKeyboardR;
		var _pause = sKeyboardEsc;
		var _validateMenu = sKeyboardSpace;
	
	if(global.gamepadMain != undefined)	{
			
	}
	
	return {
		left: _left, 
		right: _right,		
		up: _up,		
		upMenu: _upMenu,
		down: _down,		
		downMenu: _downMenu, 
		jump: _jump,
		use: _use,	
		nextCamera: _nextCamera,		
		previousCamera: _previousCamera,
		restart: _restart,
		pause: _pause,
		validateMenu: _validateMenu,
	};
}

function getInputsSprite(inputType) {
	var _inputs = getAllInputsSprite();
	switch(inputType) {
		case InputType.LEFT: return _inputs.left;
		case InputType.RIGHT: return _inputs.right;
		case InputType.UP: return _inputs.up;
		case InputType.DOWN: return _inputs.down;
		case InputType.JUMP: return _inputs.jump;
		case InputType.USE: return _inputs.use;
		case InputType.NEXT_CAMERA: return _inputs.nextCamera;
		case InputType.PREVIOUS_CAMERA: return _inputs.previousCamera;
		case InputType.RESTART: return _inputs.restart;
		case InputType.PAUSE: return _inputs.pause;
		case InputType.UP_MENU: return _inputs.upMenu;
		case InputType.DOWN_MENU: return _inputs.downMenu;
		case InputType.VALIDATE_MENU: return _inputs.validateMenu;
	}
}

enum InputType {
	LEFT = 0,
	RIGHT = 1,
	UP = 2,
	DOWN = 3,
	JUMP = 4,
	USE = 5,
	NEXT_CAMERA = 6,
	PREVIOUS_CAMERA = 7,
	RESTART = 8,
	PAUSE = 9,
	UP_MENU = 10,
	DOWN_MENU = 11,
	VALIDATE_MENU = 12
}