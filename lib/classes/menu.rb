require_relative '../modules/menu/general_menu.rb'
require_relative '../modules/menu/character_menu.rb'
require_relative '../modules/menu/devil_fruit_menu.rb'
class Menu  
  include GeneralMenu
  include CharacterMenu
  include DevilFruitMenu
  
  def initialize
    @all_options = {}
    set_menu
    provide_initial_menu
  end

  def set_menu
    add_general_menu
    add_character_menu
    add_fruit_menu
  end

  def set_options(key, value = {})
    @all_options[key] = value
  end

  def modify_option(key, new_key, value)
    @all_options[key][new_key] = value
  end

  def all_options
    @all_options
  end

  # #all_options.keys will return an array of symbols, so the 
  #   all_options_keys method converts those symbols into strings.

  def all_options_keys
    all_options.keys.map{ |key| key.to_s }
  end

  # #provide_initial_menu generates the first menu the user interacts with.
  #   It uses the first initial keys, characters, fruits, and general.

  def provide_initial_menu
    all_options_keys.each do |key|
      puts all_options[key.to_sym][:initial_options]
    end
    user_input
  end

  # #user_input uses Readline.readline (which will output the first argument
  #   on the same line the user enters input) which will present a prompt a
  #   user to enter in a value. This value is saved to the recieved_input
  #   variable, then it is passed to the match_user_response method as
  #   an argument.

  def user_input(input="\nƐ(^_^)3 ~> ")
    recieved_input = Readline.readline(input, true)
    match_user_response(recieved_input, all_options_keys)
  end

  # #match_user_response takes user input and an array as arguments.
  #   There are three possible results derived from the user input,
  #   The string "exit", nil, or a stringified key from all_options_keys.

  def match_user_response(input, array)
    response = 
    if input.match?(/exit/)
      "exit"
    else
      array.select{ |key| key.match?(/#{input}/) }[0]
    end
    execute_action(response)
  end

  # #execute_action takes the resulting response from match_user_response,
  #   and tests two conditions, nil and "exit". If neither, then a  
  #   specific key string was given. This string is used to send the
  #   user to the next menu.

  def execute_action(response)
    case response
    when nil
      puts "Sorry, I didn't get that."
      user_input
    when /exit/
      puts "See you next time!"
    else
      next_menu = "#{response}_interface"
      self.send(next_menu.to_sym)
    end
  end
end