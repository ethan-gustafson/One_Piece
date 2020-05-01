require 'pry'
class Menu 

    def self.new
        Effects.new.logo
        
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
                MenuOption.summary

            when 'length'
                puts ""
                MenuOption.episodes

            when 'characters'
                puts ""
                MenuOption.characters

            when 'fruits'
                puts ""
                MenuOption.fruits

            when 'haki'
                puts ""
                MenuOption.haki

            when 'where'
                puts ""
                MenuOption.where_to_watch
            end
        end
    end

end

