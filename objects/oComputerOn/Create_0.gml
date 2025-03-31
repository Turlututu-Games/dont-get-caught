event_inherited();

function toggleCamera() {
	
	with(oCameraDanger) {
		
		if(status == CameraStatus.ACTIVE) {
			status = CameraStatus.OFF;	
		} else {
			status = CameraStatus.ACTIVE;	
		}		
	}
	
	playSound(sfxComputerExecute);
	displayMessage(string(translate(getTranslationKey(Translation.COMPUTER_ON_OFF_CAMERA_TOGGLED)), 4))

}

function useComputer() {
	toggleCamera();
}

