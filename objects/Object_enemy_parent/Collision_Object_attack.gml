// Collision Event for obj_attack
if (alarm[1] < 0) {
    hp -= other.damage; // Reduce health by the damage taken
    image_blend = c_red; // Change color to indicate damage
    kb_x = sign(x - other.x); // Calculate knockback direction
    kb_y = sign(y - other.y); // Calculate knockback direction
    
    alarm[1] = 20; // Set knockback alarm

    // Check if health is zero or less
    if (hp <= 0) {
        instance_destroy(); // Destroy the enemy if health is zero
    }
}