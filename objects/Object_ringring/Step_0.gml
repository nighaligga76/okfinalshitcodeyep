if (place_meeting(x, y, Obj_player) && !instance_exists(object_warp)) {
  audio_play_sound(Sound_ringring, 1, false)
}