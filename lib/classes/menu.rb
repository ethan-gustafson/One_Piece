require 'pry'

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

    def summary
        puts Scraper.summary
    end

    def episodes
        puts "There are 913 episodes as of December 7th, 2019."
    end

    def where_to_watch
        puts "You can find One Piece on Crunchyroll, Funimation or Hulu!"
    end

    def characters
         puts Scraper.all_characters
         input = " "
         while input != 'exit'
         puts ""
         puts "Hit a number from 1-10 to see a character bio!"
         puts "If you would like to go back to the menu, type '0'"
         input = gets.strip.to_i

            if (1..Scraper.bios.length).include?(input)
                bio = Scraper.bios[input - 1]
                puts "#{bio}"
            elsif input < 1 || input > 10
                break
            end
        end
    end

    def fruits
        devil_fruits = ["1. Paramecia", "2. Zoan", "3. Logia"]
        puts devil_fruits
        input = " "
        while input != 'exit'
            puts ""
            puts "Choose a Devil Fruit(#1-3) to see its abilities!"
            puts "If you would like to go back to the menu, type '0'"
            input = gets.strip.to_i

            if (1..devil_fruits.length).include?(input)
                fruits = Scraper.fruits[input - 1]
                puts ""
                puts "#{fruits}"
            elsif input < 1 || input > 3
                break
            end
        end
    end

    def haki
       puts Scraper.haki
    end

end
