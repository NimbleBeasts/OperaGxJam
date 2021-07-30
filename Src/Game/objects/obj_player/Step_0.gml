if gun  {
	gun.x = x + sprite_width/2;
	gun.y = y;
}

var _colliding_gun = instance_place(x, y, obj_gunParent);

if _colliding_gun and can_pickup_gun {
	if gun { gun.drop(); }
	gun = _colliding_gun;
	gun.pickup();
	can_pickup_gun = false;
	alarm[0] = 15; // pickup cooldown
}
	

if global.player_stuck {
	ice_cooldown -= 1;
}

if ice_cooldown < 1 {
	player_unstuck_ice()
}
