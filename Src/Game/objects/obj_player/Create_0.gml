global.player = id;
global.player_score = 0;
global.player_lives = 10;
global.player_stuck = false;
global.player_on_ground = false;

can_pickup_gun = true;

//gun = instance_create_layer(x, y, "Gun", obj_gunMG);
gun = noone;

gravity_value = 0.1;

gravity = gravity_value; 

tile_ground_id = layer_tilemap_get_id("TileGround");
create_tiles();

function knockback(knockback_direction, knockback_power) {
	direction = knockback_direction;
	speed = -knockback_power;
}

function player_stuck_ice() {
	gravity = 0.0;
	speed = 0;
	global.player_stuck = true;
	alarm[1] = 2 * room_speed;
}

function player_unstuck_ice() {
	gravity = gravity_value;
	global.player_stuck = false;
}
