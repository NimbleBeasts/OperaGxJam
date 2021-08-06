fire_rate = 1;
alarm[0] = room_speed * fire_rate;
has_been_hit_this_step = false;
damage_received = 0;
bullet_obj = obj_enemyBullet;

bullet_offset_x = 25;
bullet_offset_y = 8;


function shoot_at_player() {
	var _bullet_spawn_x = x + lengthdir_x(bullet_offset_x, direction);
	var _bullet_spawn_y = y + lengthdir_y(bullet_offset_y, direction);

	var _bullet = instance_create_layer(_bullet_spawn_x, _bullet_spawn_y, "Instances", bullet_obj);
	_bullet.direction = direction;
	_bullet.image_angle = direction;
	
}