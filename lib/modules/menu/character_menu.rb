require_relative '../../classes/resources/character.rb'
require_relative '../../classes/scraper/character_scraper.rb'
require_relative './characters/straw_hat_menu.rb'
module CharacterMenu
  include StrawHatMenu

  def add_character_menu
    initial = <<~MAIN
    Type 'characters' if you would like to see the list of characters!
    MAIN
    set_options(:characters, { initial_options: initial })
  end

  def characters_interface
    add_straw_hat_menu
    provide_character_menu
  end

  def provide_character_menu
    all_options[:characters][:all_characters].each do |k, v|
      puts v
    end
    choose_character_group_input
  end

  def character_options_keys
    all_options[:characters][:all_characters].keys.map{ |k| k.to_s }
  end

  def choose_character_group_input(input="\nƐ(>_>)3 ~> ")
    response = Readline.readline(input, true)
    match_character_selection(response, character_options_keys)
  end

  def match_character_selection(input, array)
    selection = array.select{ |key| key.match?(/#{input}/) }[0]
    response =
      if selection.nil?
        "back"
      else
        selection
      end
    execute_character_group_action(response)
  end

  def execute_character_group_action(response)
    if response.match(/back/)
      provide_initial_menu
    else
      next_menu = "#{response}_interface"
      self.send(next_menu.to_sym)
    end
  end
end