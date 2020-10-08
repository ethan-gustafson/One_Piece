class Menu 

  attr_reader :scraper

  def initialize
    @scraper = Scraper.new
    greet_user
  end

  def greet_user
    puts Effect.logo
    list_options
  end

  def list_options 
    puts <<~HEREDOC 
      \nTo see a summary of the show, type 'summary'.
      Type 'episodes' to see how many episodes there are in One Piece!
      Type 'characters' if you would like to see the list of characters!
      Type 'fruits' if you would lke to see information about devil fruits!
      Type 'haki' to see what Haki is!
      Type 'where' if you would like to know where to watch One Piece!
      To quit, type 'exit' or hit enter.\n
    HEREDOC
    user_input
  end

  def user_input(input="> ")
    execute_action(Readline.readline(input, true))
  end

  def execute_action(response)
    case response
      
    when /summary/
      puts @scraper.summary.colorize(:green)
      list_options
    when /episode.*/
      puts @scraper.episode_list.colorize(:red)
      list_options
    when /character.*/
      display(Character)
    when /fruit.*/
      puts "\n#{@scraper.fruits_info.colorize(:green)}\n\n"
      display(DevilFruit)
    when /haki/
      puts @scraper.haki.colorize(:blue)
      list_options
    when /where/
      puts "\nYou can find One Piece on Crunchyroll, Funimation or Hulu!".colorize(:light_red)
      list_options
    when /exit/
      puts "Goodbye!"
    end
  end

  def display(class_name)
    class_name.list_instances
    puts "\nChoose a number to see more information!"
    puts "Hit enter to go back to the menu or 'exit' to quit.\n"
    object_menu(class_name, Readline.readline("> ", true))
  end

  def object_menu(class_name, input)
    if (1..class_name.all.length).include?(input.to_i)
      obj = class_name.all[input.to_i - 1]
      puts "\n#{obj.bio}".colorize(:blue)
      display(class_name)
    elsif input.match(/exit/)
      exit(true)
    else
      list_options
    end
  end
end