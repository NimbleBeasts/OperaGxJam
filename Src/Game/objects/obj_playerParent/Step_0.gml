
if gun  {
	//gun.x = x + sprite_width/2;
	gun.x = x;
	gun.y = y;
}

// gun pickup
var _colliding_gun = instance_place(x, y, obj_gunParent);

if _colliding_gun and can_pickup_gun and not _colliding_gun.is_picked_up{
	if gun and gun != _colliding_gun { 
		gun.drop(); 
	}
	
	if not gun or gun != _colliding_gun {
		gun = _colliding_gun;
		gun.pickup();
		gun.owner_player = id;
		
		gun.key_right = key_right;
		gun.key_left = key_left;
		gun.key_up = key_up;
		gun.key_down = key_down;

		can_pickup_gun = false;
		alarm[0] = 30; // pickup cooldown
		audio_play_sound(snd_weapon_change, 10, false);
	}
}

if gun {
	gun.is_player_grounded = is_on_ground;
	gun.is_player_stuck = is_stuck
}


if is_on_ground {
	hsp = (keyboard_check(key_right) - keyboard_check(key_left)) * 4;
	if hsp == 0 set_anim("idle") else set_anim("run");
}	

vsp += current_gravity;
if vsp > gravity_value vsp = gravity_value;


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

#endregion

if !keyboard_check(key_right) and !keyboard_check(key_left) hsp = lerp(hsp, 0, 0.05);


#region check if grounded


if place_meeting(x, y + current_gravity + 2, obj_tileWall) {
	if player_num == 1 global.player1_on_ground = true; else global.player2_on_ground = true;
	is_on_ground = true;
}
else {
	if player_num == 1 global.player1_on_ground = false; else global.player2_on_ground = false;
	is_on_ground = false;
	set_anim("jump");
}
 
#endregion

if is_on_ground or is_stuck {
	current_gravity = 0.0; 
} else current_gravity = gravity_value; 
