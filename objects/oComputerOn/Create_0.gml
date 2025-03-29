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
	displayMessage(string(translate("computerOnOffCameraToggled"), 4))

}

function useComputer() {
	toggleCamera();
}

