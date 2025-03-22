event_inherited();

if(instance_exists(oAlarm) && status == CameraStatus.ACTIVE) {
	if(place_meeting(x, y, oPlayer)) {
		if(!alarmSoundStarted) {
			alarmSoundStarted = true;
			playSound(sfxAlertCamera);
		}
		with(oAlarm) {
			detectionSpeed = other.cameraDetectionSpeed;
		}
	} else {
		if(alarmSoundStarted) {
			audio_stop_sound(sfxAlertCamera);	
		}
		with(oAlarm) {
			detectionSpeed = 1;
		}	
	}
}