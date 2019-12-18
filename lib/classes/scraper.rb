class Scraper

    def self.fruits_page
        html = "https://myanimelist.net/featured/538/Devil_Fruit__Defintion_Types_and_Users"
    end

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
        url = open(fruits_page)
        page = Nokogiri::HTML(url)
        devil_fruits = page.css(".wrapper").css("p")[0..4].text.colorize(:red)
    end

    def self.paramecia
        url = open(fruits_page)
        page = Nokogiri::HTML(url)
        paramecia = page.css(".wrapper").css("p")[10].text.colorize(:red)
    end

    def self.zoan
        url = open(fruits_page)
        page = Nokogiri::HTML(url)
        zoan = page.css(".wrapper").css("p")[14].text.colorize(:blue)
    end

    def self.logia
        url = open(fruits_page)
        page = Nokogiri::HTML(url)
        logia = page.css(".wrapper").css("p")[20].text.colorize(:yellow)
    end

    def self.all_char
        site = "https://onepiece.fandom.com/wiki/Straw_Hat_Pirates"
        url1 = open(site)
        page = Nokogiri::HTML(url1)
        char_node = page.css("table.cs.StrawHatPiratesColors").css("tr")[3].css("a") + page.css("table.cs.StrawHatPiratesColors").css("tr")[5].css("a")

        char_node.collect.with_index(1) do |node, index|
            url = node.attributes["href"].value
            num_bios = 4
            Character.new(node.text, url, num_bios)
        end
        #binding.pry
    end

    def self.grab_bio(character)
        site = "https://onepiece.fandom.com" + character.url 
        url = open(site)
        page = Nokogiri::HTML(url)
        char = page.css(".mw-content-text").css("p")[character.num_bios].text
        character.bio=(char.gsub(/\[.*?\]/, ""))
    end #character.start_index
    #character.end_index

    # def self.luffy
    #     url = open("https://onepiece.fandom.com/wiki/Monkey_D._Luffy")
    #     page = Nokogiri::HTML(url)
    #     luffy = page.css(".mw-content-text").css("p")[4].text
    #     luffy.gsub(/\[.*?\]/, "").colorize(:red)
    # end

    # def self.zoro
    #     url = open("https://onepiece.fandom.com/wiki/Roronoa_Zoro")
    #     page = Nokogiri::HTML(url)
    #     zoro = page.css(".mw-content-text").css("p")[4..6].text
    #     zoro.gsub(/\[.*?\]/, "").colorize(:red)
    # end

    # def self.nami
    #     url = open("https://onepiece.fandom.com/wiki/Nami")
    #     page = Nokogiri::HTML(url)
    #     nami = page.css(".mw-content-text").css("p")[4..5].text
    #     nami.gsub(/\[.*?\]/, "").colorize(:red)
    # end

    # def self.usopp
    #     url = open("https://onepiece.fandom.com/wiki/Usopp")
    #     page = Nokogiri::HTML(url)
    #     usopp = page.css(".mw-content-text").css("p")[4..7].text
    #     usopp.gsub(/\[.*?\]/, "").colorize(:blue)
    # end

    # def self.sanji
    #     url = open("https://onepiece.fandom.com/wiki/Sanji")
    #     page = Nokogiri::HTML(url)
    #     sanji = page.css(".mw-content-text").css("p")[4..6].text
    #     sanji.gsub(/\[.*?\]/, "").colorize(:blue)
    # end

    # def self.chopper
    #     url = open("https://onepiece.fandom.com/wiki/Tony_Tony_Chopper")
    #     page = Nokogiri::HTML(url)
    #     chopper = page.css(".mw-content-text").css("p")[4..6].text
    #     chopper.gsub(/\[.*?\]/, "").colorize(:blue)
    # end

    # def self.robin
    #     url = open("https://onepiece.fandom.com/wiki/Nico_Robin")
    #     page = Nokogiri::HTML(url)
    #     robin = page.css(".mw-content-text").css("p")[4..7].text
    #     robin.gsub(/\[.*?\]/, "").colorize(:blue)
    # end

    # def self.franky
    #     url = open("https://onepiece.fandom.com/wiki/Franky")
    #     page = Nokogiri::HTML(url)
    #     franky = page.css(".mw-content-text").css("p")[4..7].text
    #     franky.gsub(/\[.*?\]/, "").colorize(:magenta)
    # end

    # def self.brook
    #     url = open("https://onepiece.fandom.com/wiki/Brook")
    #     page = Nokogiri::HTML(url)
    #     brook = page.css(".mw-content-text").css("p")[4..7].text
    #     brook.gsub(/\[.*?\]/, "").colorize(:magenta)
    # end

    # def self.jimbei
    #     url = open("https://onepiece.fandom.com/wiki/Jinbe")
    #     page = Nokogiri::HTML(url)
    #     jimbei = page.css(".mw-content-text").css("p")[1..3].text
    #     jimbei.gsub(/\[.*?\]/, "").colorize(:magenta)
    # end
       
end