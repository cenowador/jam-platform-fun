/// @description self move

if(self_moving_x){
	var dir = 1*(self_moving_x_right)-1*(!self_moving_x_right);
	if(x >= xstart+self_moving_x_max_dist)
		self_moving_x_right = false;
	else if(x <= xstart-self_moving_x_max_dist)
		self_moving_x_right = true;
	phy_speed_x = self_moving_x_speed*dir;
}

if(self_moving_y){
	var dir = 1*(self_moving_y_down)-1*(!self_moving_y_down);
	if(y >= ystart+self_moving_y_max_dist)
		self_moving_y_down = false;
	else if(y <= ystart-self_moving_y_max_dist)
		self_moving_y_down = true;
	phy_speed_y = self_moving_y_speed*dir;
}
