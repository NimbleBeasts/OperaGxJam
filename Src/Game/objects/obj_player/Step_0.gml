if gun  {
	gun.x = x + sprite_width/2;
	gun.y = y;
}

if global.player_stuck {
	ice_cooldown -= 1;
}

if ice_cooldown < 1 {
	player_unstuck_ice()
}