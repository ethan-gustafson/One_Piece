class MenuOption

    def self.summary
        Scraper.summary.colorize(:green)
    end 

    def self.episodes
        Scraper.episode_list.colorize(:red)
    end

    def self.where_to_watch
        "You can find One Piece on Crunchyroll, Funimation or Hulu!".colorize(:light_red)
    end

    def self.characters
        puts
        Character.all.each.with_index(1) do |c, index|
            puts "#{index}. #{c.name}".colorize(:red)
        end
        # binding.pry
         input = " "
         while input != '0'
         puts "\nHit a number from (#1-10) to see a character bio!"
         puts "If you would like to go back to the menu, type '0' or hit enter!"
         input = gets.strip.to_i

            if (1..Character.all.length).include?(input)
                character = Character.all[input - 1] # input is a number. This [] is an index.
                Scraper.grab_bio(character)
                puts "\n#{character.bio}"
            else
                break
            end
        end
    end

    def self.fruits
        puts "\n#{Scraper.fruits_info.colorize(:red)}\n\n"
        DevilFruit.all.each.with_index(1) do |fruit, index|
            puts "#{index}. #{fruit.name}".colorize(:green)
        end
        
        input = " "
        while input != '0'
            puts "\nChoose a Devil Fruit(#1-6) to see its abilities!"
            puts "If you would like to go back to the menu, type '0'"
            input = gets.strip.to_i
            
            if (1..DevilFruit.all.length).include?(input)
                fruit = DevilFruit.all[input - 1]
                Scraper.grab_fruitsbio(fruit)
                puts "\n#{fruit.bio}"
            else
                break
            end
        end
    end

    def self.haki
       Scraper.haki.colorize(:blue)
    end

end