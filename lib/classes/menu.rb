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
    provide_menu
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

  def all_options_keys
    all_options.keys.map{ |key| key.to_s }
  end

  def provide_menu
    all_options_keys.each do |key|
      puts all_options[key.to_sym][:initial_options]
    end
    user_input
  end

  def user_input(input="\nƐ(^_^)3 ~> ")
    response = Readline.readline(input, true)
    execute_action(response)
  end

  def execute_action(response)
    key = all_options_keys.select{ |k| k.match?(/#{response}/) }[0]
    if !key.nil?
      next_menu = "#{key}_interface"
      self.send(next_menu.to_sym)
    elsif response.match(/exit/)
      puts "See you next time!"
    else
      puts "Sorry, I didn't get that."
      user_input
    end
  end
end