/// @description variables

spawn_rate = 0.1;
lifetime = 4;

alarm[0] = spawn_rate*room_speed;

spawn = function(){
	var px = irandom_range(x-sprite_width/2, x+sprite_width/2);
	var py = y;
	with(instance_create_depth(px, py, depth-1, obj_prop_popcorn)){
		scheduleKill(other.lifetime*room_speed);	
	}
}
