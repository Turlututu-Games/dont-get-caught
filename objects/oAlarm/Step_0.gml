/// @description Insert description here
// You can write your code in this editor

if((global.gameOptions.detectionTimer || detectionSpeed != 1) && started && !global.pause) {
	alarmTimer -= detectionSpeed;

	if(alarmTimer <= 0) {
		audio_stop_sound(sfxAlertCamera);
		playSound(sfxGameOver);
		room_restart();	
	}

}
