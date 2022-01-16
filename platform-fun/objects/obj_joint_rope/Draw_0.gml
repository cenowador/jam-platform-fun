/// @description draw rope

draw_self();
if(welded){
	var ang = point_direction(x, y, weld_targets[1].x, weld_targets[1].y);
	var ys = point_distance(x, y, weld_targets[1].x, weld_targets[1].y)/sprite_get_height(spr_joint_rope_rope);
	draw_sprite_ext(spr_joint_rope_rope, 0, x, y, 1, ys, ang+90, c_white, 1);
}
