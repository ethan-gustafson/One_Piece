class Scraper

    def self.summary
        page = Nokogiri::HTML(URI.open("https://en.wikipedia.org/wiki/List_of_One_Piece_characters"))
        summary = page.css(".mw-parser-output p")[0].text.strip.gsub(/\[.*?\]/, "").colorize(:green)
    end

    def self.haki
        page = Nokogiri::HTML(URI.open("https://onepiece.fandom.com/wiki/Haki"))
        haki = page.css(".mw-content-text").css("p")[0].text.gsub(/\[.*?\]/, "").colorize(:blue)
    end

    def self.fruits_info
        page = Nokogiri::HTML(URI.open("https://myanimelist.net/featured/538/Devil_Fruit__Defintion_Types_and_Users"))
        devil_fruits = page.css(".wrapper").css("p")[0..4].text.colorize(:red)
    end

    def self.all_fruits
        page = Nokogiri::HTML(URI.open("https://onepiece.fandom.com/wiki/Devil_Fruit"))
        fruit_node = page.css('#mw-content-text > ul')[0].css('li b a')
        fruit_node.collect.with_index do |node, index|
            url = node.attributes["href"].value
            fruits = DevilFruit.new(node.text, url)
            case index 

            when 0, 1 # 1. Paramecia & 2. Zoan
                fruits.start_i = 0
                fruits.end_i = 1 
            when 2 # Ancient Zoan 
                fruits.start_i = 12
                fruits.end_i = 13
            when 3 # Mythical Zoan 
                fruits.start_i = 16
                fruits.end_i = 18
            when 4 # Artificial Zoan 
                fruits.start_i = 0
                fruits.end_i = 2
            when 5 # Logia 
                fruits.start_i = 2  
                fruits.end_i = 3
            end
        end
    end
    
    def self.grab_fruitsbio(fruit)
        site = "https://onepiece.fandom.com" + fruit.url 
        page = Nokogiri::HTML(URI.open(site)).css('.mw-content-text')
        devilfruit = page.css("p")[fruit.start_i..fruit.end_i].text
        zoan = page.css('li')[0..2].text
        DevilFruit.all.each.with_index do |fruit, index|
            case index 
                
            when 0
                fruit.bio=devilfruit.gsub(/\[.*?\]/, "").colorize(:blue)
            when 1
                fruit.bio=devilfruit.gsub(/\[.*?\]/, "").colorize(:blue) + zoan.gsub(/\[.*?\]/, "").colorize(:green) 
            when 2, 3, 4, 5
                fruit.bio=devilfruit.gsub(/\[.*?\]/, "").colorize(:yellow)
            end
        end
    end

    def self.all_char
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
            when 3, 6, 7, 8
                character.start_i = 4
                character.end_i = 7 
            when 9
                character.start_i = 1
                character.end_i = 3 
            end
        end
    end

    def self.grab_bio(character)
        site = "https://onepiece.fandom.com" + character.url 
        page = Nokogiri::HTML(URI.open(site))
        char = page.css(".mw-content-text").css("p")[character.start_i..character.end_i].text
        character.bio=(char.gsub(/\[.*?\]/, "")).colorize(:blue)
    end 

    def self.episode_list
        page = Nokogiri::HTML(URI.open("https://onepiece.fandom.com/wiki/Episode_Guide"))
        ep = page.css(".mw-content-text").css("p")[0].text.split('.')
        episode_count = ep[1].to_s + ('.')
        episode_count.colorize(:red)
    end
    
end