debug = false;

xspd = 0;
yspd = 0;

move_speed = 2;

sprite[RIGHT] = Sprite_player_right;
sprite[UP] = Sprite_player_up;
sprite[LEFT] = Sprite_player_left;
sprite[DOWN] = Sprite_player_down; 

face = DOWN;

key_count = 0;

//combat
hp = 1
hp_total = 3;
damage = 1;

//interaction with items
interaction_offset_x = 0
interaction_offset_y = -6
interaction_radius = 19;

//for interaction for pushblok
interactDIST = 4;

tilemap = layer_tilemap_get_id("Tiles_nigga")