weapons = [obj_p_mg, obj_p_pl, obj_p_rg, obj_p_rl, obj_p_sg];


timeout = true;

function pickup() {
	alarm[0] = 10;
	timeout = false;
	return weapons[random(weapons.length() - 1)];
}