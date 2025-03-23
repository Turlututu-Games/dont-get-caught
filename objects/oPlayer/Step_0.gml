#region Controls

var _inputLeft = 0;	
var _inputRight = 0;	
var _inputJump = 0;	
var _inputUse = 0;
var _inputUp = 0;
var _inputDown = 0;
var _inputNextCamera = 0;
var _inputPreviousCamera = 0;

if(global.pause) {
	return;	
}

if(hasControl) {
// Get player inputs
	_inputLeft = global.inputs.left;
	_inputRight = global.inputs.right;
	_inputJump = global.inputs.jump; // Only true on the first frame where space is pressed
	_inputUse = global.inputs.use;
	_inputUp = global.inputs.up;	
	_inputDown = global.inputs.down;
	_inputNextCamera = global.inputs.nextCamera;
	_inputPreviousCamera = global.inputs.previousCamera;
}
#endregion

if(!started && (_inputLeft || _inputRight || _inputJump)) {
	if(instance_exists(oAlarm)) {
		with(oAlarm) {
			started = true;	
		}
	}
	started = true;	
}

#region Calculate states and movements
state = ActionStates.IDLE;
_move = _inputRight - _inputLeft; // Calculate movement.
_touchingFloor = place_meeting(x, y+1, [oWall, collisionMap]);
_onLadder = place_meeting(x, y, oLadder);
_onTopLadder = place_meeting(x, y+1, oLadder);
_canTakeRope = place_meeting(x, y-16, oRope);
_canUseComputer = place_meeting(x, y+1, oComputer);

var _affectedByGravity = !(_onTopLadder || onRope); // Indicate if the gravity must be active (not active in ladder and rope)

var _offsetMeetingY = 0;

if(_move != 0) {
	state = ActionStates.WALK;	
}

horizontalSpeed = _move * walkSpeed;

if(verticalSpeed != 0 && !_touchingFloor) {
	state = ActionStates.JUMP_FALL;	
}

if(_affectedByGravity) {
	verticalSpeed += gravityForce;	
}

// Check if the player can jump
if ((_touchingFloor || _canTakeRope) && _inputJump) {
	verticalSpeed = -jumpSpeed;
	onRope = false;
	state = ActionStates.JUMP_FALL;	
}

if (_touchingFloor && _canTakeRope && (_inputUse || _inputUp)) {
	onRope = true;
}

/*if(_canUseComputer && greenKey && _inputUse && cooldownInterraction = -1) {
	state = ActionStates.INTERRACT;	
	cooldownInterraction = 60;
}*/
if(_canUseComputer && _inputUse && cooldownInterraction = -1) {
	cooldownInterraction = 30;
	hasControl = false;
}

if(cooldownInterraction >= 0) {
	state = ActionStates.INTERRACT;	
	cooldownInterraction--;
}

if(_canUseComputer && cooldownInterraction == 0) {
	cooldownInterraction = -1;
	
	var computer = instance_nearest(x, y, oComputer);
	with(computer) {
		useComputer();
	}
	hasControl = true;
}



if (onRope) {
	state = ActionStates.ROPE;
	_offsetMeetingY = -16;
}

if(_onLadder) {
	if(!_touchingFloor) {
		state = ActionStates.CLIMB;	
	}	
}

if(_onTopLadder) {
	if(_inputUp) {
		verticalSpeed = -walkSpeed;	
	} else if(_inputDown) {
		verticalSpeed = walkSpeed;	
	} else {
		verticalSpeed = 0;
	}	
}

if(onRope) {
	if(_inputDown) {
		verticalSpeed += gravityForce;	
		onRope = false;
		state = ActionStates.JUMP_FALL;	
	}
}
#endregion


#region Calculate collisions
var meeting_horizontal = false;
var meeting_vertical = false;

	if (place_meeting(x+horizontalSpeed, y + _offsetMeetingY, [oBlock, collisionMap])) {
	// Sign will return -1 or 1 depending on the base sign of the input. So in this loop, we move 1px each time to fine the closest position
		while (!place_meeting(x+sign(horizontalSpeed), y + _offsetMeetingY, [oBlock, collisionMap])) {
			x = x + sign(horizontalSpeed);	
		}
		horizontalSpeed = 0;
		meeting_horizontal = true;
	
	}
	x = x + horizontalSpeed;	

	// Vertical collision (but getting as close as possible)
	if (place_meeting(x, y+verticalSpeed, [oBlock, collisionMap])) {
		while (!place_meeting(x, y+sign(verticalSpeed), [oBlock, collisionMap])) {
			y = y + sign(verticalSpeed);	
		}
		verticalSpeed = 0;
		meeting_vertical = true;
	}
	y = y + verticalSpeed;
	
// move_and_collide(horizontalSpeed, verticalSpeed, [oBlock, collisionMap]);
#endregion

#region Animation

switch(state) {
	case ActionStates.WALK: {
		image_speed = 0.5;
		sprite_index = sPlayerJohnWalk;	
		
		// Currently only in debug!
		if(DEBUG) {
			if(image_index % 2 == 0) {
				var _fragmentArray = array_create(1, oStep);
			
				dropItems(x,y-10 ,0, _fragmentArray);	
			}
		}

		if(previousState != state) {
			stopAllSounds();
			playSound(sfxWalk, 0.5, 0, true);
		}
		if(previousState == ActionStates.JUMP_FALL) {		
			playSound(sfxFall, 0.5);
		}
		break;	
	}
	case ActionStates.JUMP_FALL: {
		// The player is on air
		sprite_index = sPlayerJohnJump;
		image_speed = 0;
		if(verticalSpeed > 0) {
			// Falling animation
			image_index = 1;	
		} else {
			// Jumping animation
			image_index = 0;	
		}		
		stopAllSounds();
		break;	
	}
	case ActionStates.ROPE: {
		sprite_index = sPlayerJohnRope;
		stopAllSounds();
		if(horizontalSpeed == 0) {
			image_speed = 0;
		} else {
			// Rope animation
			image_speed = 0.5;
			if(previousState != state) {
				playSound(sfxRope, 0.5, 0, true);
			}
		}
		
		break;	
	}
	case ActionStates.CLIMB: {
		sprite_index = sPlayerJohnClimb;
		stopAllSounds();
		if(verticalSpeed == 0) {
			image_speed = 0;
		} else {
			// Climb animation
			image_speed = 0.5;
			if(previousState != state) {
				playSound(sfxClimb, 0.5, 0, true);
			}
		}		

		break;	
	}
	case ActionStates.INTERRACT: {
		sprite_index = sPlayerJohnInterraction;
		break;	
	}
	case ActionStates.DEAD: {
		break;	
	}
	case ActionStates.IDLE: default: {
		image_speed = 0.5;
		sprite_index = sPlayerJohnIdle;	
		stopAllSounds();
		if(previousState == ActionStates.JUMP_FALL) {		
			playSound(sfxFall);
		}
		break;	
	}
}
previousState = state;

if(horizontalSpeed != 0) {
	// Change sprite orientation based on horizontal speed
	image_xscale = sign(horizontalSpeed);	
}
#endregion


#region Camera Manipulation

var NB_CAMERA = array_length(currentCamerasObject);
// FIRST_CAMERA = currentCamerasObject[0];
// LAST_CAMERA = currentCamerasObject[NB_CAMERA - 1];
// CURRENT_CAMERA = 0;


if(activeCamera != currentCameraIndex) {
	if(currentCameraIndex == -1) {
				
		for (var i = 0; i < instance_number(oCamera); ++i;)
		{
		   array_push(currentCamerasObject, instance_find(oCamera, i));
		}
		
		var newFirstCameraIndex = array_find_index(currentCamerasObject, function(element) {
			return element.first;
		});
		
		if(newFirstCameraIndex != -1) {
			currentCameraIndex = newFirstCameraIndex;
		} else {
			currentCameraIndex = 0;
		}
	}
	
	view_set_camera(view_hport[0], currentCamerasObject[currentCameraIndex].cam);
	// CURRENT_CAMERA = currentCamerasObject[currentCameraIndex].cam;
	activeCamera = currentCameraIndex;	
}

var _previousCameraIndex = currentCameraIndex - 1;
var _nextCameraIndex = currentCameraIndex + 1;

if(_previousCameraIndex < 0) {
	_previousCameraIndex = NB_CAMERA - 1;	
}

if(_nextCameraIndex >= NB_CAMERA) {
	_nextCameraIndex = 0;	
}

if(_inputNextCamera) {
	//view_set_camera(view_hport[0], _nextCamera);
	
	//currentCamera = view_get_camera(view_current);
	currentCameraIndex = _nextCameraIndex;
}

if(_inputPreviousCamera) {
	//view_set_camera(view_hport[0], _previousCamera);
	
	//currentCamera = view_get_camera(view_current);
	currentCameraIndex = _previousCameraIndex;
}
#endregion