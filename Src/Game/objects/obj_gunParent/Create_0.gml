is_picked_up = false;

key_right = vk_right;
key_left = vk_left;
key_up = vk_up;
key_down = vk_down;

cooldown = 0;
steps_between_shots = 10;
knockback_power = 5;

gun_offset_x = 33;
gun_offset_y = -6;

function update_gun_direction_and_gun_length() {
	gun_direction = point_direction(0, 0, gun_offset_x, gun_offset_y)
	gun_length = point_distance(0, 0, gun_offset_x, gun_offset_y)
}

function pickup() {
	mask_index = spr_empty;
	is_picked_up = true;
}

function drop() {
	is_picked_up = false;
	mask_index = sprite_index;
}

update_gun_direction_and_gun_length();