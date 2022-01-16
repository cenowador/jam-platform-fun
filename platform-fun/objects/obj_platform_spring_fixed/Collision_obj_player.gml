/// @description player bouncing

bounces += 1;
alarm[0] = 3*room_speed;
with(other){
	//physics_apply_force(x, y, 0, -1000*(y <= other.y));	
}
