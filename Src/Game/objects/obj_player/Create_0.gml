global.player = id;
global.player_score = 0;
global.player_lives = 10;
global.player_stuck = false;
global.player_on_ground = false;
global.num_created_tiles = 0;


can_pickup_gun = true;

//gun = instance_create_layer(x, y, "Gun", obj_gunMG);
gun = noone;

gravity_value = 2.0;
current_gravity = gravity_value
hsp = 0;
vsp = 0;

key_up = vk_up;
key_down = vk_down;
key_left = vk_left;
key_right = vk_right;

create_tiles();
alarm[3] = 2*room_speed;

function knockback(knockback_direction, knockback_power) {
	hsp = lengthdir_x(-knockback_power, knockback_direction) * 2;
	vsp = lengthdir_y(-knockback_power, knockback_direction) * 2;
	
	//direction = knockback_direction;
	//speed = -knockback_power;
}

function player_stuck_ice() {
	current_gravity = 0.0;
	speed = 0;
	global.player_stuck = true;
	alarm[1] = 2 * room_speed;
}

function player_unstuck_ice() {
	current_gravity = gravity_value;
	global.player_stuck = false;
}

function player_add_coin() {
	audio_play_sound(snd_coin, 11, false);
}
