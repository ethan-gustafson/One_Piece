require_relative '../../classes/scraper/general_info_scraper.rb'
module GeneralMenu
  def add_general_menu
    initial = <<~INITIAL
    Type 'general' if you would like to see a general overview of the show!
    INITIAL
    @all_options[:general] = { initial_options: initial }
  end

  def general_interface
    puts <<~INTERFACE
      \nTo see a summary of the show, type 'summary'.
      Type 'episodes' to see how many episodes there are in One Piece!
      Type 'haki' to see what Haki is!
      Type 'where' if you would like to know where to watch One Piece!
      Type 'back' to go back up one menu.
    INTERFACE
    general_input
  end

  def general_interface_options
    ["summary", "episodes", "haki", "where_to_watch"]
  end

  def general_input(input="\nƐ(>_>)3 ~> ")
    recieved_input = Readline.readline(input, true)
    match_general_response(recieved_input)
  end

  def match_general_response(input)
    response = general_interface_options.select{ |k| k.match?(/#{input}/) }[0]
    execute_general_action(response)
  end

  def execute_general_action(response)
    if !response.nil?
      chosen_selection = response.to_sym
      self.send(chosen_selection)
    else
      provide_initial_menu
    end
  end

  def summary
    puts GeneralInfoScraper.summary.colorize(:green)
    general_interface
  end

  def episodes
    puts GeneralInfoScraper.episodes.colorize(:red)
    general_interface
  end

  def haki
    puts GeneralInfoScraper.haki.colorize(:blue)
    general_interface
  end

  def where_to_watch
    show_location = "\nYou can find One Piece on Crunchyroll, Funimation or Hulu!"
    puts show_location.colorize(:light_red)
    general_interface
  end
end