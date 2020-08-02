class MenuOption

    def self.input
        input = " "
        while input != ""
            puts "\nHit enter to go back to the menu!"
            input = gets.strip
        end
    end

    def self.summary
        puts Scraper.summary
        input
    end 

    def self.episodes
        puts Scraper.episode_list
        input
    end

    def self.where_to_watch
        puts "You can find One Piece on Crunchyroll, Funimation or Hulu!".colorize(:light_red)
        input
    end

    def self.characters
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
                puts "#{character.bio}"
            else
                break
            end
        end
    end

    def self.fruits
        puts "#{Scraper.fruits_info}\n\n"
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
                puts "#{fruit.bio}"
            else
                break
            end
        end
    end

    def self.haki
       puts Scraper.haki
       input
    end

end