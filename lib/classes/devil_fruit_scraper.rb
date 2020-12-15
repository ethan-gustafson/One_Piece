require_relative "../modules/scraper.rb"
class DevilFruitScraper
  extend Scraper::ClassMethods

  # `self.fruits_summary_scrape` is responsible for getting the overview about devil fruits.
  
  def self.fruits_summary_scrape
    page = Nokogiri::HTML(URI
      .open("https://myanimelist.net/featured/538/Devil_Fruit__Defintion_Types_and_Users")
    )
    fruits_info = page.css(".wrapper").css("p")[0..4]
  
    if valid_scrape?(page, fruits_info)
      "\n#{fruits_info.text}"
    else
      "\n#{display_previous_data('fruits_info')}"
    end
  end

  # `self.fruits` is responsible for getting all fruit information xml.
  #   If the xml isn't nil, we'll create the fruits. Otherwise, we'll
  #   read from previous data.

  def self.fruits
    page = Nokogiri::HTML(URI.open("https://onepiece.fandom.com/wiki/Devil_Fruit"))
    fruit_nodes = page.css('.mw-parser-output > ul')[0].css('li b a')
    
    fruits_arr = 
      if !valid_scrape?(page, fruit_nodes)
        display_previous_data("fruits")
      else
        create_fruits(fruit_nodes)
      end
    return fruits_arr
  end

  def self.create_fruits(fruits)
    fruits.each.with_index do |node, index|
      url = node.attributes["href"].value
      fruit = DevilFruit.new(node.text, ("https://onepiece.fandom.com" + url))
      set_fruit_start_and_end_index(fruit, index)
      set_fruit_bio(fruit, index)
    end
  end

  def self.set_fruit_start_and_end_index(fruit, index)
    case index 
    when 0
      set_paramecia_start_i_end_i(fruit)
    when 1
      set_logia_start_i_end_i(fruit)
    when 2
      set_zoan_start_i_end_i(fruit)
    when 3
      set_ancient_zoan_start_i_end_i(fruit)
    when 4
      set_mythical_zoan_start_i_end_i(fruit)
    when 5
      set_artificial_zone_start_i_end_i(fruit)
    end
  end

  def set_paramecia_start_i_end_i(fruit)
    fruit.start_i = 1
    fruit.end_i   = 3 
  end

  def set_logia_start_i_end_i(fruit)
    fruit.start_i = 1
    fruit.end_i   = 4
  end

  def set_zoan_start_i_end_i(fruit)
    fruit.start_i = 2
    fruit.end_i   = 4
  end

  def set_ancient_zoan_start_i_end_i(fruit)
    fruit.start_i = 14
    fruit.end_i   = 18
  end

  def set_mythical_zoan_start_i_end_i(fruit)
    fruit.start_i = 19
    fruit.end_i   = 20
  end

  def set_artificial_zone_start_i_end_i(fruit)
    fruit.start_i = 1  
    fruit.end_i   = 5
  end

  def self.set_fruit_bio(fruit, index)
    page = Nokogiri::HTML(URI.open(fruit.url)).css('.mw-parser-output')
    devilfruit = page.css("p")[fruit.start_i..fruit.end_i]

    if !valid_scrape?(page, devilfruit)
      arr = eval(File.read("data/fruits.txt"))
      correct_fruit = arr.select { |f| f[:name].eql?(fruit.name) }[0]
      fruit.bio = correct_fruit[:bio]
    else
      set_fruits_bio_by_index(fruit, index, devilfruit)
    end
  end

  def self.set_fruits_bio_by_index(fruit, index, devilfruit)
    case index 
    when 0
      fruit.bio = devilfruit.text.gsub(/\[.*?\]/, '')
    when 2
      fruit.bio = devilfruit.text.gsub(/\[.*?\]/, '')
    when 1, 3, 4, 5
      fruit.bio = devilfruit.text.gsub(/\[.*?\]/, '')
    end
  end
end