/// @description Insert description here
// You can write your code in this editor

/*
	1. on collision set frame to 1
	2. start timer
	3. on timer timeout: continue with animation
	4. unset solid, apply gravity to fall off screen
	5. start timer 1
	6. on timer 1 timeout delete


*/
if not collided {
	collided = true;
	alarm[0] = 0.8 * room_speed;
}