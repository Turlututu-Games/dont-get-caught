/// @desc getCameraText(cameraType)
/// @arg {Struct.CameraType} cameraType
/// @arg {Bool} moving
function getCameraText(cameraType, moving) {
	
	var _prefixMoving = moving ? getTranslationKey(Translation.CAMERA_MOVING_ID) : "";
	var _cameraTypeString = Translation.CAMERA_STANDARD_ID;
	
	switch(cameraType) {
		case CameraType.DETECTION: 
			_cameraTypeString =Translation.CAMERA_DETECTION_ID;
			break;
		case CameraType.INFRARED:  
			_cameraTypeString = Translation.CAMERA_INFRARED_ID;
			break;
		case CameraType.SOUND:  
			_cameraTypeString = Translation.CAMERA_SOUND_ID;
			break;
		case CameraType.STANDARD: 
		default: 
			 _cameraTypeString = Translation.CAMERA_STANDARD_ID; 
			 break;
	}
	
	return $"{_prefixMoving}{getTranslationKey(_cameraTypeString)}";
}