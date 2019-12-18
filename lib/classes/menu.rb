class Menu 

    def menu
        
        input = " "
        while input != "exit"

            puts ""
            puts "To see a summary of the show, type 'summary'."
            puts "Type 'length' to see how many episodes there are in One Piece!"
            puts "Type 'characters' if you would like to see the list of characters!"
            puts "Type 'fruits' if you would lke to see information about devil fruits!"
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

    def input
        input = " "
        while input != ""
            puts ""
            puts "Hit enter to go back to the menu!"
            input = gets.strip
        end
    end

    def summary
        puts Scraper.summary
        input
    end 

    def episodes
        puts "There are 913 episodes as of December 7th, 2019.".colorize(:light_blue)
        input
    end

    def where_to_watch
        puts "You can find One Piece on Crunchyroll, Funimation or Hulu!".colorize(:light_red)
        input
    end

    def characters
        Character.all.each.with_index(1) do |c, index|
            puts "#{index}. #{c.name}".colorize(:red)
        end

         input = " "
         while input != '0'
         puts ""
         puts "Hit a number from (#1-10) to see a character bio!"
         puts "If you would like to go back to the menu, type '0' or hit enter!"
         input = gets.strip.to_i

            if (1..Character.all.length).include?(input)
                character = Character.all[input - 1]
                Scraper.grab_bio(character)
                puts "#{character.bio}"
            else
                break
            end
        end
    end

    def fruits
        puts Scraper.fruits_bio
        puts ""
        Devilfruit.all.each.with_index(1) do |fruit, index|
            puts "#{index}. #{fruit.name}".colorize(:green)
        end

        input = " "
        while input != '0'
            puts ""
            puts "Choose a Devil Fruit(#1-3) to see its abilities!"
            puts "If you would like to go back to the menu, type '0'"
            input = gets.strip.to_i

            if (1..Devilfruit.all.length).include?(input)
                fruit = Devilfruit.all[input - 1]
                Scraper.grab_fruitsbio(fruit)
                puts "#{fruit.bio}"
            else
                break
            end
        end
    end

    def haki
       puts Scraper.haki
       input
    end

end

