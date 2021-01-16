require_relative '../modules/menu/general_menu.rb'
require_relative '../modules/menu/character_menu.rb'
require_relative '../modules/menu/devil_fruit_menu.rb'
class Menu  
  include GeneralMenu
  include CharacterMenu
  include DevilFruitMenu

  # The Menu is initialized by:
  #   - Assigning an empty hash to the @all_options variable
  #   - Setting the initial Menu with the instance method #set_menu
  #   - Outputting the Menu to the user with instance method #provide_initial_menu
  #   - Prompting a user response through the #determine_next_action instance method
  
  def initialize
    @all_options = {}
    set_menu
    provide_initial_menu
    evaluate_user_input(all_options_keys, :execute_action)
  end

  # set_menu adds each initial moduled menu into this Menu class.
  #   It does this by adding keys and values to the @all_options hash.
  #   This categorizes each area of information.

  def set_menu
    add_general_menu
    add_character_menu
    add_fruit_menu
    add_exit_message
  end

  # add_exit_message is the final key/value pair added to the @all_options hash
  #   for this Menu.

  def add_exit_message
    exit_message = "Type 'exit' to exit the program!\n"
    @all_options[:exit] = { initial_options: exit_message }
  end

  # The all_options method separates the use of setting and getting. 
  #   This instance method is semantically used specifically for read-only purposes.

  def all_options
    @all_options
  end

  # all_options.keys will return an array of symbols. The 
  #   all_options_keys method converts each symbol into strings.

  def all_options_keys
    all_options.keys.map{ |key| key.to_s }
  end

  # #provide_initial_menu generates the first menu the user interacts with.
  #   It uses the first initial keys, characters, fruits, and general.

  def provide_initial_menu
    all_options_keys.each do |key|
      printf("%s", all_options[key.to_sym][:initial_options].colorize(:green))
    end
  end

  # #user_input uses Readline.readline - which will output the first argument
  #   on the same line the user enters input - which will present a prompt a
  #   user to enter in a value. 

  def user_input(input="\nƐ(^_^)3 ~> ")
    Readline.readline(input, true)
  end

  # evaluate_user_input takes two arguments, an array, and the method used in
  #   sending the user to the next available information or options.
  #   The resulting array is accessed at index 0. If there was no
  #   match, then the array would be empty, resulting in nil.
  #   If there is a match, the return value would be a String.
  #
  #   self.send takes an argument of a symbol, plus additional arguments
  #   specified.

  def evaluate_user_input(array, method)
    input  = user_input
    action = array.select{ |key| key.match?(/#{input}/) }[0]
    self.send method, action
  end

  # execute_action will evaluate the user response. There are three possible
  #   return values: 
  #   1. Regex pattern /exit/
  #   2. nil
  #   3. String

  def execute_action(response)
    case response
    when /exit/
      puts "See you next time!"
    when nil
      puts "Sorry, I didn't get that."
      evaluate_user_input(all_options_keys, :execute_action)
    else
      next_menu = "#{response}_options"
      self.send(next_menu.to_sym)
    end
  end
end