global.player = id;
gun = instance_create_layer(x, y, "Gun", obj_gunParent);

gravity = 0.1; 

function knockback(knockback_direction) {
	direction = knockback_direction;
	speed = -5;
}