global.player = id;
global.player_score = 0;
global.player_lives = 10;
global.player_stuck = false;

gun = instance_create_layer(x, y, "Gun", obj_gunParent);

gravity = 0.1; 
ice_step_count = 120;
ice_cooldown = 0;

function knockback(knockback_direction) {
	direction = knockback_direction;
	speed = -5;
}

function player_stuck_ice() {
	gravity = 0.0;
	speed = 0;
	global.player_stuck = true;
	ice_cooldown = ice_step_count;
}

function player_unstuck_ice() {
	gravity = 0.1;
	global.player_stuck = false;
	ice_cooldown = 0;
}