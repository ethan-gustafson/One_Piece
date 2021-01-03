require_relative '../../classes/scraper/general_info_scraper.rb'
module GeneralMenu

  GENERAL_INTERFACE_OPTIONS = ["summary", "episodes", "haki", "where_to_watch"]

  def add_general_menu
    initial = <<~INITIAL
    Type 'general' if you would like to see a general overview of the show!
    INITIAL
    @all_options[:general] = { initial_options: initial }
  end

  def general_interface
    interface = <<~INTERFACE
      \nTo see a summary of the show, type 'summary'.
      Type 'episodes' to see how many episodes there are in One Piece!
      Type 'haki' to see what Haki is!
      Type 'where' if you would like to know where to watch One Piece!
      Type 'back' to go back up one menu.
    INTERFACE
    printf("%s", interface.colorize(:yellow))
    general_input
  end

  def general_input
    recieved_input = Readline.readline("\nƐ(>_>)3 ~> ", true)
    match_general_response(recieved_input)
  end

  def match_general_response(input)
    response = GENERAL_INTERFACE_OPTIONS.select{ |k| k.match?(/#{input}/) }[0]
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
    where = "\nYou can find One Piece on Crunchyroll, Funimation or Hulu!"
    printf("%s", where.colorize(:light_red))
    general_interface
  end
end