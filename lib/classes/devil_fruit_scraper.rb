require_relative "../modules/scraper.rb"
class DevilFruitScraper
  extend Scraper::ClassMethods
  
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
    when 0 # Paramecia(1)
      fruit.start_i = 1
      fruit.end_i = 3 
    when 1 # Logia(2)
      fruit.start_i = 1
      fruit.end_i = 4
    when 2 # Zoan(3)
      fruit.start_i = 2
      fruit.end_i = 4
    when 3 # Ancient Zoan(4)
      fruit.start_i = 14
      fruit.end_i = 18
    when 4 # Mythical Zoan(5) 
      fruit.start_i = 19
      fruit.end_i = 20
    when 5 # Artificial Zoan(6)
      fruit.start_i = 1  
      fruit.end_i = 5
    end
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