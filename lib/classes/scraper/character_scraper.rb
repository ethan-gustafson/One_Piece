require_relative '../../modules/scraper/scraper.rb'
class CharacterScraper
  extend Scraper::ClassMethods

  # `self.characters` is responsible for scraping character information. It will
  #   be handling xml. Calling .text on nil xml results with a NoMethodError output,
  #   effectively breaking the application. First I'm testing if the xml is valid,
  #   and if it isn't, old data will be read through the  `display_previous_data`
  #   method. If it is valid, lets pass the xml to the next method, in order to
  #   create the characters for the Character class.
  
  def self.get_characters
    page = Nokogiri::HTML(URI.open("https://onepiece.fandom.com/wiki/Straw_Hat_Pirates"))
    table = page.css("table.cs.StrawHatPiratesColors").css("tr")
    characters_xml = table[3].css("a") + table[5].css("a")

    character_nodes = 
      if !valid_scrape?(page, characters_xml)
        display_previous_data("characters")
      else
        create_characters(characters_xml)
      end
    return character_nodes
  end

  # `self.create_characters` is responsible for attaching attributes to each instance.
  #   First I take the characters argument, iterate over it with each item and its
  #   index. The character url is set, a new character instance is generated with
  #   their name and url. Next, I call `set_character_start_and_end_index`, and 
  #   `set_bio`.

  def self.create_characters(characters)
    characters.each.with_index do |node, index|
      url = node.attributes["href"].value 
      character = Character.new(node.text, url)
      set_character_start_and_end_index(character, index)
      set_bio(character)
    end
  end

  # `self.set_character_start_and_end_index` is responsible for pinpointing where a
  #   character's bio starts and ends. This is very hardcoded, and requires
  #   tedious fixing when navigating back to character wiki pages.

  def self.set_character_start_and_end_index(character, index)
    case index
    when 0
      set_luffy_start_i_end_i(character)
    when 1, 5 
      set_zoro_start_i_end_i(character)
      set_chopper_start_i_end_i(character)
    when 2
      set_nami_start_i_end_i(character)
    when 4
      set_sanji_start_i_end_i(character)
    when 3
      set_usopp_start_i_end_i(character)
    when 6
      set_robin_start_i_end_i(character)
    when 7
      set_franky_start_i_end_i(character)
    when 8
      set_brook_start_i_end_i(character)
    when 9
      set_jinbe_start_i_end_i(character)
    end
  end

  # The set_character_start_i_end_i methods are used in order to easily identify 
  #   whose information needs to be changed based on where it moved in the 
  #   wiki page.

  def self.set_luffy_start_i_end_i(character)
    character.start_i = 6
    character.end_i = 7
  end

  def self.set_zoro_start_i_end_i(character)
    character.start_i = 5
    character.end_i = 6
  end

  def self.set_chopper_start_i_end_i(character)
    character.start_i = 5
    character.end_i = 6
  end

  def self.set_nami_start_i_end_i(character)
    character.start_i = 4
    character.end_i = 5 
  end

  def self.set_sanji_start_i_end_i(character)
    character.start_i = 5  
    character.end_i = 8 
  end

  def self.set_usopp_start_i_end_i(character)
    character.start_i = 7
    character.end_i = 8 
  end

  def self.set_robin_start_i_end_i(character)
    character.start_i = 8
    character.end_i = 9 
  end

  def self.set_franky_start_i_end_i(character)
    character.start_i = 5
    character.end_i = 6 
  end

  def self.set_brook_start_i_end_i(character)
    character.start_i = 5
    character.end_i = 7 
  end

  def self.set_jinbe_start_i_end_i(character)
    character.start_i = 2
    character.end_i = 4 
  end

  # self.set_bio is responsible for scraping a specific characters bio information.
  #   Each character has their own fandom page. By setting the character start_i
  #   and end_i in the previous method, we can now set where the character bio
  #   will start and end depending on where it is on the page. If the scrape isn't
  #   valid, then we will read from the previously stored data file, which contains
  #   an array of hashes, containing the keys and values of the previous character
  #   object. The array is filtered, so that only one instance matches. The bio
  #   is then set from there.

  def self.set_bio(character)
    site = "https://onepiece.fandom.com#{character.url}" 
    page = Nokogiri::HTML(URI.open(site))
    char = page.css("#mw-content-text").css("p")[character.start_i..character.end_i]

    if !valid_scrape?(page, char)
      arr = eval(File.read("../data/characters.txt"))
      correct_character = arr.select { |c| c[:name].eql?(character.name) }[0]
      character.bio = correct_character[:bio]
    else
      character.bio = char.text.gsub(/\[.*?\]/, '')
    end
  end
end