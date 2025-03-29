/// @desc getCameraText(cameraType)
/// @arg {Struct.CameraType} cameraType
/// @arg {Bool} moving
function getCameraText(cameraType, moving) {
	
	var _prefixMoving = moving ? translate("cameraMovingId") : "";
	var _cameraTypeString = "";
	
	switch(cameraType) {
		case CameraType.DETECTION: 
			_cameraTypeString = "cameraDetectionId";
			break;
		case CameraType.INFRARED:  
			_cameraTypeString = "cameraInfraredId";
			break;
		case CameraType.SOUND:  
			_cameraTypeString = "cameraSoundId";
			break;
		case CameraType.STANDARD: 
		default: 
			 _cameraTypeString = "cameraStandardId"; 
			 break;
	}
	
	return $"{_prefixMoving}{translate(_cameraTypeString)}";
}