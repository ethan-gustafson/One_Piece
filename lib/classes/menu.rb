require 'pry'

class Menu

    def menu
        
        input = " "
        while input != "exit"

            puts ""
            puts "To see a summary of the show, type 'summary'."
            puts "Type 'length' to see how many episodes there are in One Piece!"
            puts "Type 'arcs' to see each story arc of One Piece!"
            puts "Type 'characters' if you would like to see the list of characters!"
            puts "Type 'fruits' if you would lke to see a list of all known Devil Fruits!"
            puts "Type 'haki' to see what Haki is!"
            puts "Type 'where' if you would like to know where to watch One Piece!"
            puts "To quit, type 'exit'."
            input = gets.strip
        
            case input

            when 'summary'
                puts ""
                summary

            when 'length'
                puts ""
                episodes

            when 'arcs'
                puts ""
                arcs

            when 'characters'
                puts ""
                characters

            when 'fruits'
                puts ""
                fruits

            when 'haki'
                puts ""
                haki

            when 'where'
                puts ""
                where_to_watch
            
            end
        end
    end

    def summary
        Scraper.new.summary
    end

    def episodes
        puts "There are 913 episodes as of December 7th, 2019."
    end

    def where_to_watch
        puts "You can find One Piece on Crunchyroll, Funimation or Hulu!"
    end

    def characters
         characters = Scraper.new.all_characters
         puts ""
         puts "Hit a number from 1-89 to see a character/groups bio!"
         #Scraper.new.bios
    end     # ^^ We need to implement a scraper method that gives us each character bio by index

    #def arcs
    #    lists arcs by index
     #   puts "Type a number from 1 to whatever to see more about that arc!"
     #   
    #end

    def fruits
        Scraper.new.fruits
        puts "Choose a number to see more info on those kinds of fruits!"
        input = gets.strip.to_i
        #if (1..Scraper.devil_fruits).include?(input)
        #fruit = Scraper.devil_fruits[input - 1]
        #puts  - 
        
       # end
    end # so far this shows the list of fruits. We need to put a scraper method that inputs each fruits info by index.

    def haki
        Scraper.new.haki_info
    end#done

end
