alarm[0] = room_speed * 1;
has_been_hit_this_step = false;
damage_received = 0;

bullet_offset_x = 25;
bullet_offset_y = 8;
stop_distance = 20;


function shoot_at_player() {
	var _bullet_spawn_x = x + lengthdir_x(bullet_offset_x, direction);
	var _bullet_spawn_y = y + lengthdir_y(bullet_offset_y, direction);

	var _bullet = instance_create_layer(_bullet_spawn_x, _bullet_spawn_y, "Instances", obj_enemyBullet);
	_bullet.direction = direction;
	_bullet.image_angle = direction
	
}