
if (has_been_hit_this_step) {
	has_been_hit_this_step = false;
	damage_received = 0;
	//reduce hitpoints
}

var _nearest_player = instance_nearest(x, y, obj_playerParent);
direction = point_direction(x, y, _nearest_player.x, _nearest_player.y);

if distance_to_point(_nearest_player.x, _nearest_player.y) > 20 {
	speed = 1;
} else {
	speed = 0;
}