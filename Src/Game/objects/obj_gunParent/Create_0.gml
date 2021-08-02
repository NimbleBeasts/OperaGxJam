enum Weapon
{
    Mg,
    Plasma,
    Railgun,
    Rocket,
    Shotgun
}

is_picked_up = false;

key_right = vk_right;
key_left = vk_left;
key_up = vk_up;
key_down = vk_down;

weapon = Weapon.Mg;
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
	image_angle = 0;
}

function check_for_shots() {
	x_input = keyboard_check(key_right) - keyboard_check(key_left);
	y_input = keyboard_check(key_down) - keyboard_check(key_up);

	var _angle = point_direction(x, y, x + x_input, y + y_input);

	if is_picked_up {
		if (x_input != 0 or y_input != 0) and (not global.player_stuck) {
			image_angle = _angle; // can change where gun is facing towards even if still in cooldown
			
			// if the player is on ground and is not aiming down, return
			if (global.player_on_ground) and !(_angle == 270 or _angle == 315 or _angle == 225) {return;}
			
			
			if (cooldown < 1) {
				var _bullet_spawn_x = x + lengthdir_x(gun_length, _angle + gun_direction)
				var _bullet_spawn_y = y + lengthdir_y(gun_length, _angle + gun_direction)

				var _bullet = instance_create_layer(_bullet_spawn_x, _bullet_spawn_y, "Instances", obj_bullet);
	
				_bullet.direction = _angle;	
				_bullet.image_angle = _angle;
	
				cooldown = steps_between_shots;
				global.player.knockback(_angle, knockback_power);
				
				switch (weapon) {
					case Weapon.Mg:
						audio_play_sound(snd_mg, 10, false);
						break;
					case Weapon.Plasma:
						audio_play_sound(snd_plasma, 10, false);
						break;
					case Weapon.Railgun:
						audio_play_sound(snd_railgun, 10, false);
						break;
					case Weapon.Rocket:
						audio_play_sound(snd_rocket, 10, false);
						break;
					case Weapon.Shotgun:
						audio_play_sound(snd_shotgun, 10, false);
						break;
					default:
						audio_play_sound(snd_mg, 10, false);
						break;
				}
				
		
			}
		}
	}

	cooldown = cooldown - 1;
}

update_gun_direction_and_gun_length();