/// @description define click action

// Inherit the parent event
event_inherited();

//change scale and color
image_xscale = 8;
image_yscale = 2;
image_blend = make_color_rgb(247, 141, 147);

clickedMe = function(){
	room_change(rm_menu_credits);
}
