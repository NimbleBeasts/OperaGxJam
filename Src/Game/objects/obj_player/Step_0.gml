
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


#region collision check
if place_meeting(x + hsp, y, obj_tileWall) {
	
	while !place_meeting(x + sign(hsp), y, obj_tileWall) {
		x += sign(hsp);
	}

	hsp = 0;
}
x += hsp;

if place_meeting(x, y + vsp, obj_tileWall) {
	
	while !place_meeting(x, y + sign(vsp), obj_tileWall) {
		y += sign(vsp);
	}
	
	vsp = 0;
} 

y += vsp;
y += current_gravity;

#endregion

if !keyboard_check(key_up) and !keyboard_check(key_down) vsp = lerp(vsp, 0, 0.05);
if !keyboard_check(key_right) and !keyboard_check(key_left) hsp = lerp(hsp, 0, 0.05);


#region check if grounded


if place_meeting(x, y + current_gravity, obj_tileWall) global.player_on_ground = true;
else global.player_on_ground = false;
 
#endregion

if global.player_on_ground or global.player_stuck {
	current_gravity = 0.0; 
} else current_gravity = gravity_value; 

