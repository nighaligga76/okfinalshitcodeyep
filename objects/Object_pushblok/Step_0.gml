

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

//sliding
if sliding == true{
    
    //get actual 360 direction we should move in 
    var _realdirec = face_direction * 90;
    
    // get ur target coords
    var _tartgetXDist = lengthdir_x(gridspace, _realdirec);
    var _tartgetYDist = lengthdir_y(gridspace, _realdirec);
    targetX = startpointx + _tartgetXDist;
    targetY = startpointy + _tartgetYDist;
    
    //set speeds
    var _targetdistance = point_distance(x, y, targetX, targetY) ;
    var _finalspeed = min(move_spd, _targetdistance);
    xspd = lengthdir_x(_finalspeed, _realdirec);
    yspd = lengthdir_y(_finalspeed, _realdirec);
    
    
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