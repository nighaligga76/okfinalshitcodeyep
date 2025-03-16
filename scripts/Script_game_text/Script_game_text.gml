
// paramete = text_id   
function scr_game_text (_text_id) {

    switch (_text_id) {
        case "npc 1":
            scr_text( "Hello, this is Detective Bunsuk, speaking from the Juansci Department. How may I help?.", "blue kid")
            scr_text( "H-hello, is this the police a-agency?", "green kid", -1)
             scr_text( "I really need your help right now. Somebody ruined my crops while my  goat was killed. This happened last week and now my cattle are missing!", "green kid", -1)
            scr_text("ywyyeyeyeyeye", "blue kid")
            scr_text("ok so>>", "green kid", -1)
        scr_option("maybe" , "npc 1 - ok");
        scr_option("nigha" , "npc 1 - fuk ya");
        break;
        
        case "npc 1 - ok":
            scr_text( "BETCH");
            break;
        
        case "npc 1 - fuk ya":
            scr_text( "this nigga"); 
           break;
        
        case "npc 2":
                   scr_text( "niter ")
            break;
           scr_text( "smegma ")
        case "npc 3":
                  scr_text( "nifer ") 
            break;
    }
    
}

