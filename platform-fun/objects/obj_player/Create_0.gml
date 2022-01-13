/// @description Insert description here

//defaults
physics_movement_impulse_default = 750;
physics_linear_damping_default = 3;
physics_angular_damping_default = 3;

//movement
physics_jump_impulse = 20000;
physics_movement_impulse = physics_movement_impulse_default;

//clown animation
clown_subimg = 0;
clown_image_number = sprite_get_number(spr_player_clown);

//set camera
global.camera.target = id;
