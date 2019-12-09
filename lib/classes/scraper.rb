require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

    @@bios = []
    
    def self.char_page
        html = "https://en.wikipedia.org/wiki/List_of_One_Piece_characters"
    end

    def self.fruits_page
        html = "https://onepiece.fandom.com/wiki/Devil_Fruit"
    end

    def self.haki_page
        html = "https://myanimelist.net/featured/781/The_3_Different_Types_of_One_Piece_Haki"
    end

    def self.summary
        url = open(char_page)
        page = Nokogiri::HTML(url)
        
        summary = page.search(".mw-parser-output").map do |div|
            div.at('p').text.strip
        end
        summary.to_s
    end

    def self.all_characters
        url = open(char_page)
        page = Nokogiri::HTML(url)
        characters_array = page.css(".mw-headline")

        characters = characters_array[2..11].collect{|character| character}
        characters.collect.with_index(1){ |character,index| "#{index}. #{character.attributes.values[1]}"}
    end

    def self.fruits 
        url = open(fruits_page)
        page = Nokogiri::HTML(url)
        devil_fruits = page.css(".mw-content-text")
    end
        
    def self.haki_info
        url = open(haki_page)
        page = Nokogiri::HTML(url)
        sections = page.css(".content.clearfix.featured-article-body").css("h1").text
    end

    def self.arcs
        url = open(arcs_page)
        page = Nokogiri::HTML(url)
        arcs = page.css(".mw-content-text").attr("href")
    end

    def self.luffy
        url = open("https://onepiece.fandom.com/wiki/Monkey_D._Luffy")
        page = Nokogiri::HTML(url)
        luffy = page.css(".mw-content-text").css("p")[4]
    end

    def self.zoro
        url = open("https://onepiece.fandom.com/wiki/Roronoa_Zoro")
        page = Nokogiri::HTML(url)
        zoro = page.css(".mw-content-text").css("p")[4..6]
    end

    def self.nami
        url = open("https://onepiece.fandom.com/wiki/Nami")
        page = Nokogiri::HTML(url)
        nami = page.css(".mw-content-text").css("p")[4..5]
    end

    def self.usopp
        url = open("https://onepiece.fandom.com/wiki/Usopp")
        page = Nokogiri::HTML(url)
        usopp = page.css(".mw-content-text").css("p")[4..7]
    end

    def self.sanji
        url = open("https://onepiece.fandom.com/wiki/Sanji")
        page = Nokogiri::HTML(url)
        sanji = page.css(".mw-content-text").css("p")[4..6]
    end

    def self.chopper
        url = open("https://onepiece.fandom.com/wiki/Tony_Tony_Chopper")
        page = Nokogiri::HTML(url)
        chopper = page.css(".mw-content-text").css("p")[4..6]
    end

    def self.robin
        url = open("https://onepiece.fandom.com/wiki/Nico_Robin")
        page = Nokogiri::HTML(url)
        robin = page.css(".mw-content-text").css("p")[4..7]
    end

    def self.franky
        url = open("https://onepiece.fandom.com/wiki/Franky")
        page = Nokogiri::HTML(url)
        franky = page.css(".mw-content-text").css("p")[4..7]
    end

    def self.brook
        url = open("https://onepiece.fandom.com/wiki/Brook")
        page = Nokogiri::HTML(url)
        brook = page.css(".mw-content-text").css("p")[4..7]
    end

    def self.jimbei
        url = open("https://onepiece.fandom.com/wiki/Jinbe")
        page = Nokogiri::HTML(url)
        jimbei = page.css(".mw-content-text").css("p")[1..3]
    end

    def self.bios
        @@bios << luffy.text
        @@bios << zoro.text
        @@bios << nami.text
        @@bios << usopp.text
        @@bios << sanji.text
        @@bios << chopper.text
        @@bios << robin.text
        @@bios << franky.text
        @@bios << brook.text
        @@bios << jimbei.text
        @@bios
    end
    
end

binding.pry