/// @desc getCameraText(cameraType)
/// @arg {Struct.CameraType} cameraType
function getCameraText(cameraType) {
	switch(cameraType) {
		case CameraType.DETECTION: return "DNG {0}";
		case CameraType.INFRARED: return "INF {0}";
		case CameraType.MOVING: return "MOV {0}";
		case CameraType.SOUND: return "SND {0}";
		case CameraType.STANDARD: 
		default: 
		return "CAM {0}";
	}
}