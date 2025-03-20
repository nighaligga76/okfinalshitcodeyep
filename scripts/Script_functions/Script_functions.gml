function scr_text_defaults_for_txt(){
    line_break_pos [0, page_number] = 999;
    line_break_num[page_number] = 0;
    line_break_offset[page_number] = 0;
    
    textb_spr[page_number] = Sprite_textbox_drawingbrown;
    speaker_sprite[page_number] = noone;
    speaker_side[page_number] = 1;
    
}

//paramm
//
function scr_text(_text){

    scr_text_defaults_for_txt();
    
    text[page_number] = _text;
    
    textb_spr[page_number] = Sprite_textbox_drawing;
    
    // get charac info
    if argument_count > 1 {
     switch (argument [1]) {
            
        case "blue kid": 
      speaker_sprite[page_number] = Sprite24;
     textb_spr[page_number] = Sprite_menu;
      audio_play_sound(Sound1detectiveyap, 1, false)
        break;
        
        case "green kid": 
            speaker_sprite[page_number] = Sprite23;
            textb_spr[page_number] = Sprite_textbox_drawing;
              audio_play_sound(Sound2farmeryap, 1, false)
        break;
        
        case "red kid": 
                speaker_sprite[page_number] = Sprite58;
                textb_spr[page_number] = Sprite_textbox_drawingred;
                audio_play_sound(Sound2farmeryap, 1, false)
            break;
            
        }
    }
    page_number++;
    
    
}




//param option
// param link id
function scr_option (_option, _link_id) {
option[option_number] = _option;
    option_link_id[option_number] =_link_id;
    
    option_number++;
    
}
function create_textbot(_text_id) {
with( instance_create_depth(0, 0, -9999, Object_textbox) ) 
    {
    scr_game_text(_text_id)
    
    }

}
