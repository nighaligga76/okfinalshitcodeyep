// Step Event
if (alarm[1] < 0) {
    target_x += kb_x; // Apply knockback
    target_y += kb_y; // Apply knockback
}

// Calculate direction to target
var _hor = target_x - x;
var _ver = target_y - y;

// Normalize movement vector
var length = point_distance(x, y, target_x, target_y);
if (length > 0) {
    _hor = _hor / length; // Normalize horizontal direction
    _ver = _ver / length; // Normalize vertical direction
}

// Move the enemy
move_and_collide(_hor * move_spd, _ver * move_spd, [tilemap, Object_enemy_parent]);