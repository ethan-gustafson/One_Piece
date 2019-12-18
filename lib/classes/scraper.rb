class Scraper


    def self.summary
        url = open("https://en.wikipedia.org/wiki/List_of_One_Piece_characters")
        page = Nokogiri::HTML(url)
        
        summary = page.search(".mw-parser-output").map do |div|
            div.at('p').text.strip.gsub(/\[.*?\]/, "").colorize(:green)
        end
        summary
    end

    def self.haki
        url = open("https://onepiece.fandom.com/wiki/Haki")
        page = Nokogiri::HTML(url)
        haki = page.css(".mw-content-text").css("p")[0].text
        haki.gsub(/\[.*?\]/, "").colorize(:blue)
    end

    def self.fruits_bio
        url = open("https://myanimelist.net/featured/538/Devil_Fruit__Defintion_Types_and_Users")
        page = Nokogiri::HTML(url)
        devil_fruits = page.css(".wrapper").css("p")[0..4].text.colorize(:red)
    end

    def self.all_fruits
        site = "https://onepiece.fandom.com/wiki/Devil_Fruit"
        url1 = open(site)
        page = Nokogiri::HTML(url1)
        char_node = page.css('#mw-content-text > ul')[5].css('li b a')
        char_node.collect.with_index do |node, index|
             url = node.attributes["href"].value
             fruits =Devilfruit.new(node.text, url)
             if index == 0
                fruits.start_i = 1
                fruits.end_i = 1 
            elsif index == 1  
                fruits.start_i = 1  
                fruits.end_i = 1 
            elsif index == 2  
                fruits.start_i = 2  
                fruits.end_i = 2
            end
        end
    end
    
    def self.grab_fruitsbio(fruit)
        site = "https://onepiece.fandom.com" + fruit.url 
        url = open(site)
        page = Nokogiri::HTML(url)
        devilfruit = page.css('.mw-content-text').css("p")[fruit.start_i..fruit.end_i].text
        fruit.bio=(devilfruit.gsub(/\[.*?\]/, ""))
    end

    def self.all_char
        site = "https://onepiece.fandom.com/wiki/Straw_Hat_Pirates"
        url1 = open(site)
        page = Nokogiri::HTML(url1)
        char_node = page.css("table.cs.StrawHatPiratesColors").css("tr")[3].css("a") + page.css("table.cs.StrawHatPiratesColors").css("tr")[5].css("a")

        char_node.collect.with_index do |node, index|
            url = node.attributes["href"].value 
            character = Character.new(node.text, url)
            if index == 0
                character.start_i = 4
                character.end_i = 4 
            elsif index == 1 || index == 4 || index == 5  
                character.start_i = 4  
                character.end_i = 6 
            elsif 2
                character.start_i = 4
                character.end_i = 5 
            elsif 3 || 6 || 7 || 8
                character.start_i = 4
                character.end_i = 7 
            elsif 9
                character.start_i = 1
                character.end_i = 3 
            end
        end
    end

    def self.grab_bio(character)
        site = "https://onepiece.fandom.com" + character.url 
        url = open(site)
        page = Nokogiri::HTML(url)
        char = page.css(".mw-content-text").css("p")[character.start_i..character.end_i].text
        character.bio=(char.gsub(/\[.*?\]/, ""))
    end 
    

end