//weapons = [obj_p_mg, obj_p_pl, obj_p_rg, obj_p_rl, obj_p_sg];
weapons = [obj_gunMG, obj_gunPlasmaRifle, obj_gunRailgun, obj_gunRocketLauncher, obj_gunShotgun];

timeout = true;

function spawn_gun() {
	alarm[0] = 10;
	timeout = false;
	gun = instance_create_layer(x, y, "Gun", weapons[irandom_range(0, array_length(weapons) - 1)]);
	return gun;
}