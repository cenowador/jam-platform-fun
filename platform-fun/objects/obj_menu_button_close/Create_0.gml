/// @description define click action

// Inherit the parent event
event_inherited();

//change scale and color
image_xscale = 8;
image_yscale = 2;
image_blend = make_color_rgb(179, 255, 156);

clickedMe = function(){
	game_end();
}
