if !gun  {
	gun = other;
	gun.is_picked_up = true;
}

if gun.object_index != other.object_index {
	/* sets old gun is_picked_up to false
	/ and sets new guns is_picked_up to true after changing the gun variable to
	the colliding gun */
	
	gun.is_picked_up = false;
	gun = other;
	gun.is_picked_up = true;
}