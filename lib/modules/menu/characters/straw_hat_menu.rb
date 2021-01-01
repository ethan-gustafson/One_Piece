module StrawHatMenu
  def add_straw_hat_menu
    main = <<~MAIN
    \nType 'main' if you would like to see the list of main characters!
    MAIN
    modify_option(:characters, :all_characters, { main_characters: main })
  end

  def main_characters_interface
    retrieve_straw_hats
    list_straw_hats
    choose_main_character
  end

  def retrieve_straw_hats
    character_count = Character.all.count
    if character_count < 10 ||  character_count != 10
      CharacterScraper.get_characters
    end
  end

  def list_straw_hats
    puts
    Character.all.each.with_index(1) do |c, index|
      puts "#{index}. #{c.name}".colorize(:red)
    end
  end

  def choose_main_character
    puts <<~CHOOSE
    \nChoose a number to see more information!
    Hit enter to go back to the menu or 'exit' to quit.
    CHOOSE
    get_user_choice_of_main_character
  end

  def get_user_choice_of_main_character
    response = Readline.readline("\nƐ(>_>)3 ~> ", true)
    show_main_character_bio(response)
  end

  def show_main_character_bio(input)
    index = input.to_i
    if (1..Character.all.count).include?(index)
      printf("%s", Character.all[index - 1].bio.colorize(:green))
      list_straw_hats
      choose_main_character
    else
      provide_character_menu
    end
  end
end