#macro DEBUG false
#macro STEAM false

#macro RATIO 16 / 9

#macro FPS game_get_speed(gamespeed_fps)

#macro Debug:DEBUG true
#macro DesktopSteam:STEAM true

#macro GUI_LAYER "GUI"
#macro CAMERA_LAYER "Cameras"
#macro PLAYER_LAYER "Player"
#macro INTERRACTIONS_LAYER "Interractions"
#macro LEVEL_DESIGN_LAYER "LevelDesign"
#macro COLLISIONS_LAYER "Collisions"

// Calculate appropriate direction (four directions) 
#macro CARDINAL_DIR round(direction/90)

// Calculate appropriate direction (horizontal directions) 
#macro HORIZONTAL_DIR round(direction/180)

#macro PLAYER_GRAVITY_FORCE 0.3
#macro PLAYER_WALK_SPEED 4
#macro PLAYER_JUMP_SPEED 5

#macro PLAYER_SPRITE_WALK sPlayerJohnWalk
#macro PLAYER_SPRITE_JUMP sPlayerJohnJump
#macro PLAYER_SPRITE_ROPE sPlayerJohnRope
#macro PLAYER_SPRITE_CLIMB sPlayerJohnClimb
#macro PLAYER_SPRITE_USE sPlayerJohnInterraction
#macro PLAYER_SPRITE_IDLE sPlayerJohnIdle

#macro SAVE "Settings/savedata.ini"
#macro LOGFILE "game.log"
#macro SAVE_STEAM "savedata.ini"