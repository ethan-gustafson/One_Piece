class Scraper

  def initialize
    all_characters
    all_fruits
  end

  def all_characters
    page = Nokogiri::HTML(URI.open("https://onepiece.fandom.com/wiki/Straw_Hat_Pirates"))
    char_node = page.css("table.cs.StrawHatPiratesColors").css("tr")[3].css("a") + page.css("table.cs.StrawHatPiratesColors").css("tr")[5].css("a")

    char_node.collect.with_index do |node, index|
      url = node.attributes["href"].value 
      character = Character.new(node.text, url)
      case index

      when 0
        character.start_i = 5
        character.end_i = 5 
      when 1, 4, 5  
        character.start_i = 4  
        character.end_i = 6 
      when 2
        character.start_i = 4
        character.end_i = 5 
      when 3, (6..8)
        character.start_i = 4
        character.end_i = 7 
      when 9
        character.start_i = 1
        character.end_i = 3 
      end
    end
    all_character_bios
  end

  def all_character_bios
    Character.all.each do |c|
      grab_bio(c)
    end
    Character.all
  end

  def grab_bio(character)
    site = "https://onepiece.fandom.com" + character.url 
    page = Nokogiri::HTML(URI.open(site))
    char = page.css(".mw-content-text").css("p")[character.start_i..character.end_i].text
    character.bio=(char.gsub(/\[.*?\]/, "")).colorize(:blue)
  end
  
  def fruits_info
    page = Nokogiri::HTML(URI.open("https://myanimelist.net/featured/538/Devil_Fruit__Defintion_Types_and_Users"))
    devil_fruits = page.css(".wrapper").css("p")[0..4].text
  end

  def all_fruits
    page = Nokogiri::HTML(URI.open("https://onepiece.fandom.com/wiki/Devil_Fruit"))
    fruit_node = page.css('#mw-content-text > ul')[0].css('li b a')
    fruit_node.collect.with_index do |node, index|
      url = node.attributes["href"].value
      fruit = DevilFruit.new(node.text, ("https://onepiece.fandom.com" + url))
      case index 

      when 0 # Paramecia(1)
        fruit.start_i = 0
        fruit.end_i = 1 
      when 1 # Logia(2)
        fruit.start_i = 2
        fruit.end_i = 3
      when 2 # Zoan(3)
        fruit.start_i = 0
        fruit.end_i = 1
      when 3 # Ancient Zoan(4)
        fruit.start_i = 16
        fruit.end_i = 18
      when 4 # Mythical Zoan(5) 
        fruit.start_i = 19
        fruit.end_i = 20
      when 5 # Artificial Zoan(6)
        fruit.start_i = 0  
        fruit.end_i = 3
      end
    end
    all_fruits_bio
  end
  
  def all_fruits_bio
    DevilFruit.all.each.with_index do |fruit, index|
      page = Nokogiri::HTML(URI.open(fruit.url)).css('.mw-content-text')
      devilfruit = page.css("p")[fruit.start_i..fruit.end_i].text
      zoan = page.css('li')[0..2].text
      case index 
              
      when 0
        fruit.bio=devilfruit.gsub(/\[.*?\]/, "").colorize(:blue)
      when 2
        fruit.bio=devilfruit.gsub(/\[.*?\]/, "").colorize(:blue) + zoan.gsub(/\[.*?\]/, "").colorize(:green) 
      when 1, 3, 4, 5
        fruit.bio=devilfruit.gsub(/\[.*?\]/, "").colorize(:yellow)
      end
    end
    DevilFruit.all
  end

  def summary
    page = Nokogiri::HTML(URI.open("https://en.wikipedia.org/wiki/List_of_One_Piece_characters"))
    "\n#{page.css(".mw-parser-output p")[0].text.strip.gsub(/\[.*?\]/, "")}"
  end

  def haki
    page = Nokogiri::HTML(URI.open("https://onepiece.fandom.com/wiki/Haki"))
    "\n#{page.css(".mw-content-text").css("p")[0].text.gsub(/\[.*?\]/, "")}"
  end

  def episode_list
    page = Nokogiri::HTML(URI.open("https://onepiece.fandom.com/wiki/Episode_Guide"))
    "\n#{page.css(".mw-content-text").css("p")[0].text.split('.')[1].to_s + ('.')}"
  end
    
end