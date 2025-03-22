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
	displayMessage("Camera 4 has been toggled")
}

function useComputer() {
	toggleCamera();
}

