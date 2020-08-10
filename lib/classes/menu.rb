class Menu 

    def self.user_input
        input = " "
        while input != ""
            puts "\nHit enter to go back to the menu!"
            input = gets.strip
        end
    end

    def self.new
        puts Effect.logo
        
        input = " "
        while input != "exit"

            puts "To see a summary of the show, type 'summary'."
            puts "Type 'episodes' to see how many episodes there are in One Piece!"
            puts "Type 'characters' if you would like to see the list of characters!"
            puts "Type 'fruits' if you would lke to see information about devil fruits!"
            puts "Type 'haki' to see what Haki is!"
            puts "Type 'where' if you would like to know where to watch One Piece!"
            puts "To quit, type 'exit'.\n\n"
            input = gets.strip
        
            case input

            when 'summary'
                puts "\n#{MenuOption.summary}"
                user_input
            when 'episodes'
                puts "\n#{MenuOption.episodes}"
                user_input
            when 'characters'
                MenuOption.characters
            when 'fruits'
                MenuOption.fruits
            when 'haki'
                puts "\n#{MenuOption.haki}"
                user_input
            when 'where'
                puts "\n#{MenuOption.where_to_watch}"
                user_input
            end
        end
    end

end

