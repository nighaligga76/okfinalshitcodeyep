right_key = keyboard_check(vk_right);
left_key = keyboard_check(vk_left);
up_key= keyboard_check(vk_up);
down_key = keyboard_check(vk_down);
interactKeyPressed = keyboard_check_pressed(vk_space);


//get xspd and yspd 
xspd = (right_key - left_key) * move_speed
yspd = (down_key - up_key) * move_speed

if instance_exists(Object_pause)
{
    xspd = 0;
    yspd = 0;
}

mask_index = sprite [DOWN];
if yspd == 0
{
if xspd > 0 { face = RIGHT };
if xspd < 0 { face = LEFT };
}

if  xspd > 0 && face == LEFT {face = RIGHT};
if  xspd < 0 && face == RIGHT {face = LEFT};

if xspd == 0
{
if yspd < 0 { face = UP };
if yspd > 0 { face = DOWN }; 
}

if  yspd > 0 && face == UP {face = DOWN};
if  yspd < 0 && face == DOWN {face = UP};

sprite_index = sprite[face];    


if place_meeting(x + xspd, y, Obj_wall)
{
    xspd = 0;
}

if place_meeting(x, y + yspd,  Obj_wall)
{
    yspd = 0;
}

if place_meeting(x + xspd, y, obj_bluedoor)
{
    xspd = 0;
}

if place_meeting(x, y + yspd,  obj_bluedoor)
{
    yspd = 0;
}

x += xspd;
y += yspd;



//interaction
var instance = collision_circle(x+ interaction_offset_x, y + interaction_offset_y, interaction_radius, obj_interactable, false, true);

if (instance != noone){
    switch (instance.type) {
        case OBJECTS.BLUEKEY:
            key_count += 1
        instance_destroy(instance);
        audio_play_sound(Soundpickup, 1, false)
        break;
        case OBJECTS.BLUEDOOR: 
            instance_destroy(instance);
            break;
        case OBJECTS.LOCKED_BLUEDOOR: 
            if (key_count > 0) {
                key_count -=1;
                audio_play_sound(Soundopendoor, 1, false)
                    instance_destroy(instance);
        }
                    break;
    }
}

//interact with pushblock
if interactKeyPressed == true
{
    // find 360 degree direction to check for push blok
    var _checkDir = face * 90;
    
    //see if we find push block 
    var _checkX = x + lengthdir_x(interactDIST, _checkDir);
    var _checkY = y + lengthdir_y(interactDIST, _checkDir);
    var _pushblockinst = instance_place(_checkX, _checkY, Object_pushblok);
    
    // if there is  a pushblock, teel it to the slide and which direc to slide ;
    if instance_exists(_pushblockinst) && _pushblockinst.sliding == false
{       
    _pushblockinst.sliding = true;
        _pushblockinst.face_direction = face;
    }
    
}

// combat attack
if (keyboard_check_pressed(vk_space)){
var _inst = instance_create_depth(x, y, depth, Object_attack) 
_inst.image_angle = point_direction(0, 0, _hor, _ver ) -
    _inst.damage *= damage;
}