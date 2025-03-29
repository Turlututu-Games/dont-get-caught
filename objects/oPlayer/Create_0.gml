horizontalSpeed = 0;
verticalSpeed = 0;

gravityForce = PLAYER_GRAVITY_FORCE;

walkSpeed = PLAYER_WALK_SPEED;
jumpSpeed = PLAYER_JUMP_SPEED;

hasControl = true;
onRope = false;

//currentCamera = 10; // view_get_camera(view_current);
currentCameraIndex = -1// view_get_camera(view_current);
activeCamera = 0;

currentCamerasObject = [];

/* keys = {
	green: false,
	red: false,
	blue: false
}*/

inventory = ds_list_create();

cooldownInterraction = -1;

collisionMap = layer_tilemap_get_id(layer_get_id(COLLISIONS_LAYER));

/*var NB_CAMERA = 2;
FIRST_CAMERA = currentCamera + 1;
LAST_CAMERA = FIRST_CAMERA + NB_CAMERA;

view_set_camera(view_hport[0], FIRST_CAMERA);*/


state = ActionStates.IDLE;
previousState = -1;
currentSound = -1;

function stopAllSounds() {
	audio_stop_sound(sfxClimb);
	audio_stop_sound(sfxFall);
	audio_stop_sound(sfxRope);
	audio_stop_sound(sfxWalk);
}

started = false; // Set to true after the first game interraction

optionContinueGame = new MenuItem("menuContinue", function() {
	global.pause = false;
});

optionRestartGame = new MenuItem("menuRestart", function() {
	global.pause = false;
	room_restart();
});

optionReturnToMenu = new MenuItem("menuReturnToMenu", function() {
	global.pause = false;
	slideTransition(Transition.GOTO, rMenu); 
	global.allowPause = true;
});