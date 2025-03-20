
// paramete = text_id   
function scr_game_text (_text_id) {

    switch (_text_id) {
        case "npc 1":
            scr_text( "This is the Juansci Police Department, how can I help you?", "blue kid")
                scr_text( "Hello? I just saw the missing daughter from weeks ago!", "red kid")
            scr_text( "Alright ma'am, take a deep breath. Can you tell me exactly what you saw?", "blue kid", -1)
             scr_text( "Okay-okay, well... she had wings and no legs at all!", "red kid", -1)
            scr_text("It looked like someone was feeding her crops and bits of cattle. ", "red kid")
            scr_text("Hmm. Did you see who did it?", "blue kid", -1)
        scr_text("He was all hooded. It was dark with lights flickering. ", "red kid")
             scr_text(" I felt someone's eyes on me so I immediately called the police. ", "red kid", -1)
              scr_text("Listen carefully ma'am. Stay where you are, but do not go near the mansion", "blue kid", -1) 
                  scr_text(" I’m sending officers right now.", "blue kid") 
         scr_text(" Okay. Please tell them to hurry.", "red kid", -1)
            scr_text(" Help is on the way. Stay hidden and don't get too close. ", "blue kid") 
         scr_text(" -Call Ends-") 
        
        break;
        
        case "Farmer and Detective":
                        scr_text( "Hello, this is Detective Bunsuk, speaking from the Juansci Department.", "blue kid")
                        scr_text( "How may I help?.", "blue kid")
                        scr_text( "H-hello, is this the police a-agency?", "green kid", -1)
                      scr_text( "I really need your help right now. Somebody ruined my crops while my  goat was killed.", "green kid", -1)
        scr_text( "My cattles are also missing!", "green kid", -1)
                    scr_text("Alright-alright sir! Please calm down. ", "blue kid")
                       scr_text("Can you tell me exactly what happened? Do you have any clue who the intruder could be? ", "blue kid")
                        scr_text("A few weeks ago, hmmm I went to check my fields, and my crops were destroyed.",  "green kid" )
       scr_text( "I assumed it was just an animal since we live close in the wild but it happened again last week and killed my goat. ", "green kid" )
       scr_text( "My goat was cutted open in the stomach, oh no IT MUST'VE BEEN A MANANANGGAL! but.. ", "blue kid" )
       scr_text( "I noticed that there's no bite marks on my goat's body. ",  "green kid" )
        scr_text( "Now my cattle are missing! I'm sure they're also the ones who took my cattle. ", "green kid", -1)
                        scr_text("I understand sir. Do you have any idea about who or what it could be?  ", "blue kid")
                       scr_text( "I really don't know either, my place is really far from the city, ", "green kid", -1)
            scr_text( "And i-it's completely impossible for someone to get to.", "green kid", -1)
        scr_text("Ok sir, I'm sending someone there to investigate what happened", "blue kid")
        scr_text("Help is on the way. Stay on the line if you need further assistance.", "blue kid")
         scr_text(" -Call Ends-") 
                         
                    break;
           scr_text( "smegma ")
        case "npc 3":
                  scr_text( "nifer ") 
            break;
    }
    
}

