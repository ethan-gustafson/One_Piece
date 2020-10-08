class Menu 

  def initialize
    @scraper = Scraper.new
    list_options
  end

  def user_input
    input = " "
    while input != ""
      puts "\nHit enter to go back to the menu!"
      input = gets.strip
    end
  end

  def list_options
    puts Effect.logo
        
    input = " "
    while input != "exit"
      options
      input = gets.strip
        
      case input

      when 'summary'
        puts @scraper.summary.colorize(:green)
        user_input
      when 'episodes'
        puts @scraper.episode_list.colorize(:red)
        user_input
      when 'characters'
        Character.list_instances

        input = " "
        while input != '0'
          puts "\nHit a number from (#1-10) to see a character bio!"
          puts "If you would like to go back to the menu, type '0' or hit enter!"
          input = gets.strip.to_i

          if (1..Character.all.length).include?(input)
            character = Character.all[input - 1] # input is a number. This [] is an index.
            puts "\n#{character.bio}".colorize(:blue)
          else
            break
          end
        end
      when 'fruits'
        puts "\n#{@scraper.fruits_info.colorize(:green)}\n\n"
        DevilFruit.list_instances
        
        input = " "
        while input != '0'
          puts "\nChoose a Devil Fruit(#1-6) to see its abilities!"
          puts "If you would like to go back to the menu, type '0'"
          input = gets.strip.to_i
            
          if (1..DevilFruit.all.length).include?(input)
            fruit = DevilFruit.all[input - 1]
            puts "\n#{fruit.bio}".colorize(:blue)
          else
            break
          end
        end
      when 'haki'
        puts @scraper.haki.colorize(:blue)
        user_input
      when 'where'
        puts "\nYou can find One Piece on Crunchyroll, Funimation or Hulu!".colorize(:light_red)
        user_input
      end
    end
  end

  def options 
    puts <<~HEREDOC 
      To see a summary of the show, type 'summary'.
      Type 'episodes' to see how many episodes there are in One Piece!
      Type 'characters' if you would like to see the list of characters!
      Type 'fruits' if you would lke to see information about devil fruits!
      Type 'haki' to see what Haki is!
      Type 'where' if you would like to know where to watch One Piece!
      To quit, type 'exit'.\n
    HEREDOC
  end
end