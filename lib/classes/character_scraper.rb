require_relative "../modules/scraper.rb"
class CharacterScraper
  extend Scraper::ClassMethods
  
  def self.characters
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

  def self.create_characters(characters)
    characters.each.with_index do |node, index|
      url = node.attributes["href"].value 
      character = Character.new(node.text, url)
      set_character_start_and_end_index(character, index)
      set_bio(character)
    end
  end

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

  def self.set_character_start_and_end_index(character, index)
    case index
    when 0 # 0. Monkey D. Luffy
      character.start_i = 6
      character.end_i = 7
    when 1, 5  # 1. Roronoa Zoro, 5. Tony Tony Chopper
      character.start_i = 5  
      character.end_i = 6 
    when 2 # 2. Nami
      character.start_i = 4
      character.end_i = 5 
    when 4 # 4. Sanji
      character.start_i = 5  
      character.end_i = 8 
    when 3 # 3. Usopp
      character.start_i = 7
      character.end_i = 8 
    when 6 # 6. Nico Robin
      character.start_i = 8
      character.end_i = 9 
    when 7 # 7. Franky
      character.start_i = 5
      character.end_i = 6 
    when 8 # 8. Brook
      character.start_i = 5
      character.end_i = 7 
    when 9 # 9. Jinbe
      character.start_i = 2
      character.end_i = 4 
    end
  end
end