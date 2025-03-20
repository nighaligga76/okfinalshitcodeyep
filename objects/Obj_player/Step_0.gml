// Input handling
right_key = keyboard_check(vk_right);
left_key = keyboard_check(vk_left);
up_key = keyboard_check(vk_up);
down_key = keyboard_check(vk_down);
interactKeyPressed = keyboard_check_pressed(vk_space);

// Get horizontal and vertical movement
var _hor = right_key - left_key; // 1 for right, -1 for left
var _ver = down_key - up_key; // 1 for down, -1 for up

// Calculate speed
xspd = _hor * move_speed;
yspd = _ver * move_speed;

// Pause check
if instance_exists(Object_pause) {
    xspd = 0;
    yspd = 0;
}

// Update facing direction based on movement
if (xspd != 0 || yspd != 0) {
    if (xspd > 0) { 
        face = RIGHT; 
        sprite_index = Sprite_player_right; // Set walking sprite immediately
    } else if (xspd < 0) { 
        face = LEFT; 
        sprite_index = Sprite_player_left; // Set walking sprite immediately
    }
    
    if (yspd > 0) { 
        face = DOWN; 
        sprite_index = Sprite_player_down; // Set walking sprite immediately
    } else if (yspd < 0) { 
        face = UP; 
        sprite_index = Sprite_player_up; // Set walking sprite immediately
    }
} else {
    // Maintain current facing direction if not moving
    if (face == RIGHT) { 
        sprite_index = Sprite_player_right; 
    } else if (face == LEFT) { 
        sprite_index = Sprite_player_left; 
    } else if (face == UP) { 
        sprite_index = Sprite_player_up; 
    } else if (face == DOWN) { 
        sprite_index = Sprite_player_down; 
    }
}

// Collision checks
if place_meeting(x + xspd, y, Obj_wall) {
    xspd = 0;
}
if place_meeting(x, y + yspd, Obj_wall) {
    yspd = 0;
}
if place_meeting(x + xspd, y, obj_bluedoor) {
    xspd = 0;
}
if place_meeting(x, y + yspd, obj_bluedoor) {
    yspd = 0;
}

// Move the player
x += xspd;
y += yspd;

// Interaction logic
var instance = collision_circle(x + interaction_offset_x, y + interaction_offset_y, interaction_radius, obj_interactable, false, true);
if (instance != noone) {
    switch (instance.type) {
        case OBJECTS.BLUEKEY:
            key_count += 1;
            instance_destroy(instance);
            audio_play_sound(Soundpickup, 1, false);
            break;
        case OBJECTS.BLUEDOOR: 
            instance_destroy(instance);
            break;
        case OBJECTS.LOCKED_BLUEDOOR: 
            if (key_count > 0) {
                key_count -= 1;
                audio_play_sound(Soundopendoor, 1, false);
                instance_destroy(instance);
            }
            break;
    }
}

// Interact with push block
if interactKeyPressed {
    var _checkDir = face * 90;
    var _checkX = x + lengthdir_x(interactDIST, _checkDir);
    var _checkY = y + lengthdir_y(interactDIST, _checkDir);
    var _pushblockinst = instance_place(_checkX, _checkY, Object_pushblok);
    
    if instance_exists(_pushblockinst) && !_pushblockinst.sliding {
        _pushblockinst.sliding = true;
        _pushblockinst.face_direction = face;
    }
}

// Combat attack
if (keyboard_check_pressed(vk_space)) {
    var _inst = instance_create_depth(x, y, depth, Object_attack);
    _inst.image_angle = point_direction(0, 0, _hor, _ver);
    
}