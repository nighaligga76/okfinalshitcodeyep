// Alarm 0 Event
if (instance_exists(Obj_player) && distance_to_object(Obj_player) < distance_to_player) {
    // Chase the player
    target_x = Obj_player.x;
    target_y = Obj_player.y;
} else {
    // Move randomly within a certain range
    target_x = random_range(max(0, xstart - 100), min(room_width, xstart + 100));
    target_y = random_range(max(0, ystart - 100), min(room_height, ystart + 100));
}

// Reset the alarm
alarm[0] = 60; // Reset the alarm to trigger again