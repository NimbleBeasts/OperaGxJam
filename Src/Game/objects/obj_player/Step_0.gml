if gun  {
	gun.x = x + sprite_width/2;
	gun.y = y;
}

// gun pickup
var _colliding_gun = instance_place(x, y, obj_gunParent);

if _colliding_gun and can_pickup_gun {
	if gun and gun != _colliding_gun { 
		gun.drop(); 
	}
	
	if not gun or gun != _colliding_gun {
		gun = _colliding_gun;
		gun.pickup();
		can_pickup_gun = false;
		alarm[0] = 30; // pickup cooldown
	}
}


#region tile collision
//right collision
if (tilemap_get_at_pixel(tile_ground_id, bbox_right + hspeed, y) != 0) {
	x = round(x);
	while (tilemap_get_at_pixel(tile_ground_id, bbox_right, y) == 0) {
		x += 1;	
	}
	
	while (tilemap_get_at_pixel(tile_ground_id, bbox_right, y) != 0) {
		x -= 1;	
	}
	hspeed = 0.0;
}

// left collision
if (tilemap_get_at_pixel(tile_ground_id, bbox_left + hspeed, y) != 0) {
	x = round(x);
	while (tilemap_get_at_pixel(tile_ground_id, bbox_left, y) == 0) {
		x -= 1;	
	}
	
	while (tilemap_get_at_pixel(tile_ground_id, bbox_left, y) != 0) {
		x += 1;	
	}
	hspeed = 0.0;
}

//up collision
if (tilemap_get_at_pixel(tile_ground_id, x, bbox_top + vspeed) != 0) {
	y = round(y);
	while (tilemap_get_at_pixel(tile_ground_id, x, bbox_top) == 0) {
		y -= 1;	
	}
	
	while (tilemap_get_at_pixel(tile_ground_id, x, bbox_top) != 0) {
		y += 1;	
	}
	
	vspeed = 0.0;
}

//down collision
if (tilemap_get_at_pixel(tile_ground_id, x, bbox_bottom + vspeed) != 0) {
	y = round(y);
	while (tilemap_get_at_pixel(tile_ground_id, x, bbox_bottom) == 0) {
		y += 1;	
	}
	
	while (tilemap_get_at_pixel(tile_ground_id, x, bbox_bottom) != 0) {
		y -= 1;	
	}
	
	vspeed = 0.0;

} 


#endregion

#region check if grounded

if place_meeting(x, y + 2, obj_groundObject) {
	global.player_on_ground = true;
	hspeed = 0;
}
else global.player_on_ground = false;
 
#endregion

if global.player_on_ground or global.player_stuck gravity = 0.0; else gravity = gravity_value;
