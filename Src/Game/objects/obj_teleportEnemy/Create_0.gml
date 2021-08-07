spawn_difference = 75;
can_move = false;
can_shoot = false;
fire_rate = 1;

bullet_offset_x = 25;
bullet_offset_y = 8;
bullet_obj = obj_enemyBullet;


function teleport() {
	var _nearest_player = instance_nearest(x, y, obj_playerParent);
	var _teleport_x = _nearest_player.x + choose(-spawn_difference, spawn_difference);
	var _teleport_y = _nearest_player.y + choose(-spawn_difference, spawn_difference);
	x = _teleport_x;
	y = _teleport_y;
	alarm[0] = 2 * room_speed;
}

function set_can_move(to) {
	can_move = to;
	if can_move speed = 3;
	else speed = 0;
}

function set_can_shoot(to) {
	can_shoot = to;
	if can_shoot = true alarm[1] = fire_rate * room_speed;
}

function shoot_at_player() {
	var _bullet_spawn_x = x + lengthdir_x(bullet_offset_x, direction);
	var _bullet_spawn_y = y + lengthdir_y(bullet_offset_y, direction);

	var _bullet = instance_create_layer(_bullet_spawn_x, _bullet_spawn_y, "Instances", bullet_obj);
	_bullet.direction = direction;
	_bullet.image_angle = direction;
	
}

set_can_move(false);
set_can_shoot(true);

teleport();
