/// @description moves camera

// Get current camera position
var camX = camera_get_view_x(camera);
var camY = camera_get_view_y(camera);
var camW = camera_get_view_width(camera);
var camH = camera_get_view_height(camera);

// Set target camera position
if(instance_exists(target)){
	var targetX = target.x - camW/2 + camera_property_boundary_x;
	var targetY = target.y - camH/2 + camera_property_boundary_y;
	
	// Clamp the target to room bounds
	targetX = clamp(targetX, 0, room_width - camW);
	targetY = clamp(targetY, 0, room_height - camH);

	// Smoothly move the camera to the target position
	camX = lerp(camX, targetX, camera_property_smooth);
	camY = lerp(camY, targetY, camera_property_smooth);
}
else{
	camX = 0;
	camY = 0;
}
// Apply camera position
camera_set_view_pos(camera, camX, camY);