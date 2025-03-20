

//what stae we in
        //idle / not sliding
if sliding == false{
    
    //set out cords
    startpointx = x;
   startpointy = y;
    
    // reset movement speed
    xspd = 0;
    yspd =0;
    
}
//ggetgrounf type
// we in reccesed space
if place_meeting(x,y, Object_pushblokarea)
{
    pushblockArea = true;
    
}
else {
    pushblockArea = false
}

//were on ice 
if place_meeting(x,y, Object_ice)
{
    onIce= true;
    
}
else {
    onIce = false
}



//sliding
if sliding == true{
    
    //get actual 360 direction we should move in 
    var _realdirec = face_direction * 90;
    
    // get ur target coords
    var _tartgetXDist = lengthdir_x(gridspace, _realdirec);
    var _tartgetYDist = lengthdir_y(gridspace, _realdirec);
    targetX = startpointx + _tartgetXDist;
    targetY = startpointy + _tartgetYDist;
    
    // if on ice - keep adding to the coords until edge of ice wall
    if onIce == true
    {
        // rest ur target x and y
        targetX = startpointx
        targetY = startpointy
        
        // search eacvh space ahead to make there is ice, and not a wall
        while place_meeting(targetX + _tartgetXDist, targetY + _tartgetYDist, Object_ice)
            && !place_meeting(targetX + _tartgetXDist, targetY + _tartgetYDist, Obj_wall)
        {
            targetX += _tartgetXDist
            targetY += _tartgetYDist
        }
    }
    
    //set speeds
    var _targetdistance = point_distance(x, y, targetX, targetY) ;
    var _finalspeed = min(move_spd, _targetdistance);
    xspd = lengthdir_x(_finalspeed, _realdirec);
    yspd = lengthdir_y(_finalspeed, _realdirec);
    
    //cancel movement if werre currentlynin apush block area but our coords are noit
    if pushblockArea == true && !place_meeting(targetX, targetY, Object_pushblokarea)
    {
        xspd = 0
        yspd = 0
        
    }
    
    // dont let the block move to a grid space that has wall in it 
    if place_meeting(targetX, targetY, Obj_wall){
        xspd = 0;
        yspd = 0;
    }
}

//move
x += xspd;
y += yspd;

//done wih sliding

if xspd == 0 && yspd == 0{
    
    sliding = false;
    
}
    //depth

depth = -bbox_bottom