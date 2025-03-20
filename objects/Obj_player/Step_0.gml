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
        sprite_index = sprite[RIGHT]; // Set walking sprite immediately
    } else if (xspd < 0) { 
        face = LEFT; 
        sprite_index = sprite[LEFT]; // Set walking sprite immediately
    }
    
    if (yspd > 0) { 
        face = DOWN; 
        sprite_index = sprite[DOWN]; // Set walking sprite immediately
    } else if (yspd < 0) { 
        face = UP; 
        sprite_index = sprite[UP]; // Set walking sprite immediately
    }
    
    // Update the facing angle based on movement
    facing = point_direction(0, 0, _hor, _ver);
} else {
    // Maintain current facing direction if not moving
    sprite_index = sprite[face]; 
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
        
        
                case OBJECTS.BSKEY:
            key_count += 1;
            instance_destroy(instance);
            audio_play_sound(Soundpickup, 1, false);
            break;
        case OBJECTS.BSDOOR: 
            instance_destroy(instance);
            break;
        case OBJECTS.LOCKED_BSDOOR: 
            if (key_count > 0) {
                key_count -= 1;
                audio_play_sound(Soundopendoor, 1, false);
                instance_destroy(instance);
            }
            break;
    }
}

// Interact with push block
if interactKeyPressed == true {
    var _checkDir = face * 90;
    
    //see if we find apushblock
    var _checkX = x + lengthdir_x(interactDIST, _checkDir);
    var _checkY = y + lengthdir_y(interactDIST, _checkDir);
    var _pushblockinst = instance_place(_checkX, _checkY, Object_pushblok);
    
    if instance_exists(_pushblockinst) && _pushblockinst.sliding == false {
        _pushblockinst.sliding = true;
        _pushblockinst.face_direction = face;
    }
}

// Combat attack
if (interactKeyPressed && room == Room_finalmaze) {
    var _inst = instance_create_depth(x, y, depth, Object_attack);
    _inst.image_angle = facing; // Set the angle of the attack based on the player's facing direction
    _inst.damage *= damage; // Apply damage
    audio_play_sound(Sound_slash, 1, false)
}