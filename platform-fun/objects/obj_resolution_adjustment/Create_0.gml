/// @description resize rooms
//scaling everybody to be 1280x720
var idealWidth = 1280;
var idealHeight = 720;

//getting the aspect ratio of the monitor
var aspectRatio = display_get_width()/display_get_height();

//the game is designed to fit mainly 16:9 (720p, 1080p), but can fit 2:1
if(aspectRatio < 2) //if less than 2:1
	if(aspectRatio > 1.32 && aspectRatio < 1.7)
		aspectRatio = 1.333; // sets to 16:9
	else
		aspectRatio = 1.778; // sets to 16:9
else //if bigger than 16:9
	aspectRatio = 2; // sets to 2:1

//calculating the ideal width based on the aspect ratio
idealWidth = round(idealHeight*aspectRatio);

//width cannot be odd since there is no monitor with odd pixel count
if(idealWidth % 2 > 0) //if idealWidth is odd
	idealWidth+=1;
	
//applying the scale found to every room of the game
for(var i = 1; i <= room_last; ++i)//it starts from 1 because the _config_room is the 0, and it's useless to scale it
	if(room_exists(i))
	{
		room_set_viewport(i, 0, true, 0, 0, idealWidth, idealHeight);
		room_set_view_enabled(i, true);
	}

//resizing the surface where things are drawn, the window, the camera and gui
surface_resize(application_surface, idealWidth, idealHeight);
camera_set_view_size(camera_get_active(), idealWidth, idealHeight);
display_set_gui_size(idealWidth, idealHeight);
window_set_size(idealWidth, idealHeight);

//center window
alarm[0] = true;