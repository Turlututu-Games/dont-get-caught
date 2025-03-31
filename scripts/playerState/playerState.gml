enum PlayerStates {
	CLIMB,
	DEAD,
	FALL,
	IDLE,
	INTERRACT,	
	JUMP,
	LOCKED,
	ROPE,
	WALK
}

/// @func playerState() Execute state for oPlayer
function playerState() {
	with(oPlayer) {
		switch(state) {
			case PLAYER_STATE.ACT: 
				playerStateAct();
				break;
			case PLAYER_STATE.ANIMATION: 
				playerStateAnimation();	
				break;
			case PLAYER_STATE.ATTACK: 
				playerStateAttack();	
				break;
			case PLAYER_STATE.BONK: 
				playerStateBonk();	
				break;
			case PLAYER_STATE.FREE: 
				playerStateFree(); 
				break;
			case PLAYER_STATE.JUMP: 
				playerStateJump();
				break;
			case PLAYER_STATE.LOCKED: 
				playerStateLocked();
				break;
			case PLAYER_STATE.ROLL: 
				playerStateRoll();
				break;

			default: 
				playerStateFree(); 
				break;
		}
	
	}
}

function setPlayerState(_state) {
	show_debug_message("Switch to state {0}", getPlayerStateName(_state));
	with(oPlayer) {
		state = _state;	
	}
}