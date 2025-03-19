
// Check if the player is colliding with the talkbox
if (place_meeting(x, y, Obj_player) && !instance_exists(object_warp)) {
    // If the dialog is not active, create the text box
    if (!dialog_active) {
        create_textbot(text_id);
        dialog_active = true; // Set the dialog as active
    }
} else {
    // Reset the dialog state when the player leaves the talkbox area
    dialog_active = false; // Allow the dialog to be triggered again
}