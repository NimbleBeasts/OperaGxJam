// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function subtract_player_lives(damage) {
	global.player_lives -= damage;
	show_debug_message("Life = " + string(global.player_lives));
}