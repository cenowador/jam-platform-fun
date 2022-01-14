/// @description clears surfaces

//bg surface
if(surface_exists(surf_bg)){
	surface_free(surf_bg);
	surf_bg = noone;
}
//bg surface buffer
if(buffer_exists(surf_buff)){
	buffer_delete(surf_buff);
	surf_buff = noone;
}