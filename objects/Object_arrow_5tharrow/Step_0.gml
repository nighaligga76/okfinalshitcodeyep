if position_meeting(mouse_x, mouse_y, id) && mouse_check_button_pressed(mb_left)
{
    var _fade = instance_create_layer(0, 0, "Instances", Object_fader);
            _fade.target_room = Room_3; // Set target room
    }