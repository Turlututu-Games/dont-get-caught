#region Auto-Generated Translations
enum Translation {
	CAMERA_DETECTION_ID,
	CAMERA_INFRARED_ID,
	CAMERA_MOVING_ID,
	CAMERA_SOUND_ID,
	CAMERA_STANDARD_ID,
	COLOR_BLUE,
	COLOR_GREEN,
	COLOR_RED,
	COLOR_YELLOW,
	COMPUTER_GATE_OPEN,
	COMPUTER_MISSING_KEY,
	COMPUTER_ON_OFF_CAMERA_TOGGLED,
	END_OF_DEMO,
	EXIT,
	MENU_CONTINUE,
	MENU_PAUSE,
	MENU_PLAYTEST1_OPTION1,
	MENU_PLAYTEST1_OPTION2,
	MENU_RESTART,
	MENU_RETURN_TO_MENU,
	MENU_START_DEMO,
	MENU_TEST_LEVELS,
	OPTION_DISPLAY,
	OPTION_FULL_SCREEN,
	OPTION_LANGUAGE,
	OPTION_LANGUAGE_ENGLISH,
	OPTION_LANGUAGE_FRENCH,
	OPTION_MUSIC,
	OPTION_NO_FULL_SCREEN,
	OPTIONS,
	OPTION_SOUND,
	OPTION_VOLUME_HIGH,
	OPTION_VOLUME_LOW,
	OPTION_VOLUME_MEDIUM,
	TUTO_AND,
	TUTO_CAMERA1,
	TUTO_CAMERA2,
	TUTO_CLIMB,
	TUTO_FALL,
	TUTO_INTERRACT,
	TUTO_JUMP,
	TUTO_KEEP_MOVING,
	TUTO_MOVE,
	TUTO_OR,
	TUTO_PRESS,
	TUTO_RESET1,
	TUTO_RESET2,
	TUTO_ROPE,
	TUTO_TO,
	TUTO_USE
}

/// @func getTranslationKey(_key) Return the translation key
/// @param {Struct.Translation} _key
function getTranslationKey(_key) {
	switch(_key) {
		case Translation.CAMERA_DETECTION_ID: return "cameraDetectionId";
		case Translation.CAMERA_INFRARED_ID: return "cameraInfraredId";
		case Translation.CAMERA_MOVING_ID: return "cameraMovingId";
		case Translation.CAMERA_SOUND_ID: return "cameraSoundId";
		case Translation.CAMERA_STANDARD_ID: return "cameraStandardId";
		case Translation.COLOR_BLUE: return "colorBlue";
		case Translation.COLOR_GREEN: return "colorGreen";
		case Translation.COLOR_RED: return "colorRed";
		case Translation.COLOR_YELLOW: return "colorYellow";
		case Translation.COMPUTER_GATE_OPEN: return "computerGateOpen";
		case Translation.COMPUTER_MISSING_KEY: return "computerMissingKey";
		case Translation.COMPUTER_ON_OFF_CAMERA_TOGGLED: return "computerOnOffCameraToggled";
		case Translation.END_OF_DEMO: return "endOfDemo";
		case Translation.EXIT: return "exit";
		case Translation.MENU_CONTINUE: return "menuContinue";
		case Translation.MENU_PAUSE: return "menuPause";
		case Translation.MENU_PLAYTEST1_OPTION1: return "menuPlaytest1Option1";
		case Translation.MENU_PLAYTEST1_OPTION2: return "menuPlaytest1Option2";
		case Translation.MENU_RESTART: return "menuRestart";
		case Translation.MENU_RETURN_TO_MENU: return "menuReturnToMenu";
		case Translation.MENU_START_DEMO: return "menuStartDemo";
		case Translation.MENU_TEST_LEVELS: return "menuTestLevels";
		case Translation.OPTION_DISPLAY: return "optionDisplay";
		case Translation.OPTION_FULL_SCREEN: return "optionFullScreen";
		case Translation.OPTION_LANGUAGE: return "optionLanguage";
		case Translation.OPTION_LANGUAGE_ENGLISH: return "optionLanguageEnglish";
		case Translation.OPTION_LANGUAGE_FRENCH: return "optionLanguageFrench";
		case Translation.OPTION_MUSIC: return "optionMusic";
		case Translation.OPTION_NO_FULL_SCREEN: return "optionNoFullScreen";
		case Translation.OPTIONS: return "options";
		case Translation.OPTION_SOUND: return "optionSound";
		case Translation.OPTION_VOLUME_HIGH: return "optionVolumeHigh";
		case Translation.OPTION_VOLUME_LOW: return "optionVolumeLow";
		case Translation.OPTION_VOLUME_MEDIUM: return "optionVolumeMedium";
		case Translation.TUTO_AND: return "tutoAnd";
		case Translation.TUTO_CAMERA1: return "tutoCamera1";
		case Translation.TUTO_CAMERA2: return "tutoCamera2";
		case Translation.TUTO_CLIMB: return "tutoClimb";
		case Translation.TUTO_FALL: return "tutoFall";
		case Translation.TUTO_INTERRACT: return "tutoInterract";
		case Translation.TUTO_JUMP: return "tutoJump";
		case Translation.TUTO_KEEP_MOVING: return "tutoKeepMoving";
		case Translation.TUTO_MOVE: return "tutoMove";
		case Translation.TUTO_OR: return "tutoOr";
		case Translation.TUTO_PRESS: return "tutoPress";
		case Translation.TUTO_RESET1: return "tutoReset1";
		case Translation.TUTO_RESET2: return "tutoReset2";
		case Translation.TUTO_ROPE: return "tutoRope";
		case Translation.TUTO_TO: return "tutoTo";
		case Translation.TUTO_USE: return "tutoUse";
		default: return "";
	}
}
#endregion


function resetTexts() {
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	
	draw_set_alpha(1.0);	
	draw_set_color(c_white);
	draw_set_font(fMenu);
}

function textsDrawSetup(_size,_halign, _valign ) {
	resetTexts();

	switch(_size) {
		case 24:
		
			draw_set_font(fMenu);

			break;
		case 72:
			draw_set_font(fMenu72);

			break;
		case 48:
			draw_set_font(fMenu48);

			break;
		default:
			show_debug_message("Invalid size {0}", _size);
	}
		
	draw_set_halign(_halign);
	draw_set_valign(_valign);
}

/// @func setLanguage(lang) Return the language identifier
/// @param {string} lang
function getLanguageIdentifier(lang) {
	switch(lang) {
		case "fr":
		case "en":		
			return lang
		
		default:
			return "en"
	}
}

/// @func setLanguage(lang) Set the current game language. Default to "en" if not found
/// @param {string} lang
function setLanguage(lang) {
	switch(lang) {
		case "fr":
			global.language = oGame.languageTable.french;
			break;
		case "en":
		default:
			// Invalid language, fallback to EN
			global.language = oGame.languageTable.english;
			break;
	}
}

/// @func translate(identifier) Get the translation for a text identifier
/// @param {string} _identifier string identifier
/// @return {string}
function translate(_identifier) {
	// Get the text from store. the variable_struct_get is needed here
	var _textFragment =  variable_struct_get(global.language, _identifier);
	
	if(_textFragment == undefined) {
		// Unknown text. Reporting the error, including the current language
		show_debug_message(
			"Error 1: unknown text identifier in language.json \"{0}\" (lang: {1})",
			_identifier,
			global.gameOptions.language
		);

		return _identifier;
	}
	
	return _textFragment;
}