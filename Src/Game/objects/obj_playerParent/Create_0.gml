global.num_created_tiles = 0;
global.num_tile_levels = 2;
player_num = 1;

is_stuck = false;
is_on_ground = false;

can_pickup_gun = true;

//gun = instance_create_layer(x, y, "Gun", obj_gunMG);
gun = noone;

gravity_value = 3.0;
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
	if player_num == 1 global.player1_stuck = true; else global.player2_stuck = true;
	is_stuck = true;
	alarm[1] = 2 * room_speed;
}

function player_unstuck_ice() {
	current_gravity = gravity_value;
	if player_num == 1 global.player1_stuck = false; else global.player2_stuck = false
	is_stuck = false;

}

function player_add_coin() {
	audio_play_sound(snd_coin, 11, false);
}

function set_anim(anim_string) {
	switch anim_string {
		case "jump":
			if player_num == 1 sprite_index = spr_player1_jump; else sprite_index = spr_player2_jump;
			break;
		case "idle":
			if player_num == 1 sprite_index = spr_player1_idle; else sprite_index = spr_player2_idle;
			break;
		case "run":
			if player_num == 1 sprite_index = spr_player1_run; else sprite_index = spr_player2_run;
			break;
	}
}