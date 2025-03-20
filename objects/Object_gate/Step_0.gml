if instance_exists(buttonobj)
{
    state = buttonobj.state 
}


//closed

if state == 0 {
    mask_index = sprite_index
}

//open
if state == 1 {
    mask_index = Sprite_nocollision
}
//reflect the state change
image_index = state