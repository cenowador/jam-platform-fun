/// @description draws surface copy

//creates a buffer with the content of the application surface
if(!buffer_exists(surf_buff)){
	//draws overlay
	//draw_set_color(c_black);
	//draw_set_alpha(0.5);
	//draw_rectangle(0, 0, view_wport[0], view_hport[0], false);
	//draw_set_alpha(1);
	
	//creates a buffer with surface content
	var sw = surface_get_width(application_surface);
	var sh = surface_get_height(application_surface);
	surf_buff = buffer_create(sw*sh*4, buffer_fast, 1);
	buffer_get_surface(surf_buff, application_surface, 0);
	//deactivates everyone
	var deactivation = modal_deactivation(keepers);
	deactivated_instances = deactivation.deactivated_instances;
	deactivated_layers = deactivation.deactivated_layers;
}

if(!surface_exists(surf_bg)){
	var sw = surface_get_width(application_surface);
	var sh = surface_get_height(application_surface);
	surf_bg = surface_create(sw, sh);
	buffer_set_surface(surf_buff, surf_bg, 0);
	//draw surface
	draw_surface_stretched(surf_bg, 0, 0, view_wport[0], view_hport[0]);
}
