
// paramete = text_id   
function scr_game_text (_text_id) {

    switch (_text_id) {
        case "npc 1":
            scr_text( "Hello, this is Detective Bunsuk, speaking from the Juansci Department.", "blue kid")
                scr_text( "How may I help?.", "blue kid")
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
        
        case "Farmer and Detective":
                        scr_text( "Hello, this is Detective Bunsuk, speaking from the Juansci Department.", "blue kid")
                        scr_text( "How may I help?.", "blue kid")
                        scr_text( "H-hello, is this the police a-agency?", "green kid", -1)
                        scr_text( "I really need your help right now. Somebody ruined my crops while my  goat was killed. This happened last week and now my cattle are missing!", "green kid", -1)
                    scr_text("Alright-alright sir! Please calm down. ", "blue kid")
                       scr_text("Can you tell me exactly what happened? Do you have any clue who the intruder could be? ", "blue kid")
                        scr_text("A few weeks ago, hmmm I went to check my fields, and my crops were destroyed. I assumed it was just an animal since we live close in the wild but it happened again last week and killed my goat. My goat was cutted open in the stomach, she's pregnant- oh no IT MUST'VE BEEN A MANANANGGAL! but.. I noticed that there's no bite marks on my goat's body. Someone clearly intruded on my farm and trampled my crops! Now my cattle are missing! I'm sure they're also the ones who took my cattle. ", "green kid", -1)
                        scr_text("I understand sir. Do you have any idea about who or what it could be?  ", "blue kid")
                       scr_text( "I really don't know either, my place is really far from the city, ", "green kid", -1)
            break; scr_text( "And i-it's completely impossible for someone to get to.", "green kid", -1)
                    break;
           scr_text( "smegma ")
        case "npc 3":
                  scr_text( "nifer ") 
            break;
    }
    
}

