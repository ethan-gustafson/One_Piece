require_relative '../../classes/scraper/general_info_scraper.rb'
module GeneralMenu

  GENERAL_MENU_OPTIONS = ["summary", "episodes", "haki", "where_to_watch", "back", "exit"]

  # add_general_menu is added into the @all_options hash at Menu initialization.

  def add_general_menu
    initial = <<~INITIAL
    Type 'general' if you would like to see a general overview of the show!
    INITIAL
    @all_options[:general] = { initial_options: initial }
  end

  # general_options outputs general menu options then prompts for user input.

  def general_options
    options = <<~OPTIONS
      \nTo see a summary of the show, type 'summary'.
      Type 'episodes' to see how many episodes there are in One Piece!
      Type 'haki' to see what Haki is!
      Type 'where' if you would like to know where to watch One Piece!
      Type 'back' to go back up one menu.
      OPTIONS
    printf("%s", options.colorize(:yellow))
    evaluate_user_input(GENERAL_MENU_OPTIONS, :execute_general_action)
  end

  # execute_general_action handles all user options available. 

  def execute_general_action(response)
    shared_actions_responses(response, all_options_keys, :general_options)
    case response
    when /back/
      provide_initial_menu
      evaluate_user_input(all_options_keys, :execute_main_actions)
    else
      method = response.to_sym
      self.send(method)
    end
  end
  # multiple conditions
  # Most are shared between classes
  # create one more case condition method and use it in these methods

  # The rest of the methods below rely on Scraper classes code. 

  def summary
    puts GeneralInfoScraper.summary.colorize(:green)
    general_options
  end

  def episodes
    puts GeneralInfoScraper.episodes.colorize(:red)
    general_options
  end

  def haki
    puts GeneralInfoScraper.haki.colorize(:blue)
    general_options
  end

  def where_to_watch
    where = "\nYou can find One Piece on Crunchyroll, Funimation or Hulu!\n"
    printf("%s", where.colorize(:light_red))
    general_options
  end
end