       identification division.
       program-id. more-or-less.
       
       data division.
       working-storage section.
           77 line_index PIC 99.
           77 guess PIC 99.      

           77 seed PIC 9(8).
           77 secret PIC 99.                                       

       screen section.

           1 clean_screen.
               2 blank screen.

           1 ask_gess.
               2 line line_index col 1 "have a guess = ".
               2 pic 99 to guess required.    

           1 display_more.
               2 line line_index col 1 "+".   

           1 display_less.
               2 line line_index col 1 "-".    

       procedure division.

           initialize line_index.
           initialize guess.

           move 1 to line_index.
       
           move function current-date(9:8) to seed.
           compute secret = function random(seed) * 100 + 1.

           perform test before until secret = guess
               
               move 0 to guess
               display ask_gess
               accept ask_gess

               compute line_index = line_index + 1

               if guess < secret then
                   display display_more
                   
               end-if
               
               if guess > secret then
                   display display_less
               end-if         

               compute line_index = line_index + 1
           
           end-perform.

           display clean_screen.
           display "well done !".
           

       stop run.
