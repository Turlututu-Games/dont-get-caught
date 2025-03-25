show_debug_message("Steam event type: {0}", async_load[? "event_type"])

switch(async_load[? "event_type"]) {
 case "steam_shutdown":
	game_end();
}