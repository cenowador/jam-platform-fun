/// @description draw clown

draw_self();

var cy = y-sprite_height/2-5;
var cx = x-5;
draw_sprite(spr_player_clown, clown_subimg, cx, cy);

//draw basket
with(obj_control){
	if(level_kitten_saved || level_panda_saved || level_puppy_saved){
		var bx = cx;
		var by = cy-43;
		if(level_puppy_saved)
			draw_sprite(spr_player_puppy, 0, bx-13, by-10);
		if(level_kitten_saved)
			draw_sprite(spr_player_kitten, 0, bx+13, by-10);
		if(level_panda_saved)
			draw_sprite(spr_player_baby_panda, 0, bx, by-10);
			
		draw_sprite(spr_player_basket, 0, bx, by);
	}
}