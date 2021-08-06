if is_grounded {
	var _nearest_player = instance_nearest(x, y, obj_playerParent);
	if _nearest_player.x > x {
		hsp = 1 * speed_value;
	} else hsp = -1 * speed_value;

	x += hsp;
}


if place_meeting(x, y + vsp, obj_tileWall) {
	while !place_meeting(x, y + sign(vsp), obj_tileWall) {
		y += sign(vsp);
	}
	
	vsp = 0;
} 


y += vsp;



#region check if grounded


if place_meeting(x, y + vsp + 2, obj_tileWall) {
	is_grounded = true;
}
else {
	is_grounded = false;
}

#endregion