x_input = keyboard_check(key_right) - keyboard_check(key_left);
y_input = keyboard_check(key_down) - keyboard_check(key_up);

var _angle = point_direction(x, y, x + x_input, y + y_input);

if (x_input != 0 or y_input != 0) and (cooldown < 1) {
	image_angle = _angle;
	
	var _bullet_spawn_x = x + lengthdir_x(gun_length, _angle + gun_direction)
	var _bullet_spawn_y = y + lengthdir_y(gun_length, _angle + gun_direction)

	var _bullet = instance_create_layer(_bullet_spawn_x, _bullet_spawn_y, "Instances", obj_bullet);
	
	_bullet.direction = _angle;	
	
	cooldown = steps_between_shots;
	global.player.knockback(_angle);
}

cooldown = cooldown - 1;