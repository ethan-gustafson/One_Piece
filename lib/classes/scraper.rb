require 'open-uri'
require 'nokogiri'
require 'colorize'
require 'pry'

class Scraper

    @@bios = []
    @@fruits = []
    
    def self.char_page
        html = "https://en.wikipedia.org/wiki/List_of_One_Piece_characters"
    end

    def self.fruits_page
        html = "https://myanimelist.net/featured/538/Devil_Fruit__Defintion_Types_and_Users"
    end

    def self.summary
        url = open(char_page)
        page = Nokogiri::HTML(url)
        
        summary = page.search(".mw-parser-output").map do |div|
            div.at('p').text.strip.colorize(:green)
        end
        summary
    end

    def self.all_characters
        url = open(char_page)
        page = Nokogiri::HTML(url)
        characters_array = page.css(".mw-headline")

        characters = characters_array[2..11].collect{|character| character}
        char = characters.collect.with_index(1){ |character,index| "#{index}. #{character.attributes.values[1]}"}
    end

    def self.haki
        url = open("https://onepiece.fandom.com/wiki/Haki")
        page = Nokogiri::HTML(url)
        haki = page.css(".mw-content-text").css("p")[0].text
        haki.gsub(/\[.*?\]/, "")
    end

    def self.fruits_bio
        url = open(fruits_page)
        page = Nokogiri::HTML(url)
        devil_fruits = page.css(".wrapper").css("p")[0..4].text.colorize(:red)
    end

    def self.paramecia
        url = open(fruits_page)
        page = Nokogiri::HTML(url)
        devil_fruits = page.css(".wrapper").css("p")[10].text.colorize(:red)
    end

    def self.zoan
        url = open(fruits_page)
        page = Nokogiri::HTML(url)
        devil_fruits = page.css(".wrapper").css("p")[14].text.colorize(:blue)
    end

    def self.logia
        url = open(fruits_page)
        page = Nokogiri::HTML(url)
        devil_fruits = page.css(".wrapper").css("p")[20].text.colorize(:yellow)
    end

    def self.luffy
        url = open("https://onepiece.fandom.com/wiki/Monkey_D._Luffy")
        page = Nokogiri::HTML(url)
        luffy = page.css(".mw-content-text").css("p")[4].text
        luffy.gsub(/\[.*?\]/, "").colorize(:red)
    end

    def self.zoro
        url = open("https://onepiece.fandom.com/wiki/Roronoa_Zoro")
        page = Nokogiri::HTML(url)
        zoro = page.css(".mw-content-text").css("p")[4..6].text
        zoro.gsub(/\[.*?\]/, "").colorize(:red)
    end

    def self.nami
        url = open("https://onepiece.fandom.com/wiki/Nami")
        page = Nokogiri::HTML(url)
        nami = page.css(".mw-content-text").css("p")[4..5].text
        nami.gsub(/\[.*?\]/, "").colorize(:red)
    end

    def self.usopp
        url = open("https://onepiece.fandom.com/wiki/Usopp")
        page = Nokogiri::HTML(url)
        usopp = page.css(".mw-content-text").css("p")[4..7].text
        usopp.gsub(/\[.*?\]/, "").colorize(:blue)
    end

    def self.sanji
        url = open("https://onepiece.fandom.com/wiki/Sanji")
        page = Nokogiri::HTML(url)
        sanji = page.css(".mw-content-text").css("p")[4..6].text
        sanji.gsub(/\[.*?\]/, "").colorize(:blue)
    end

    def self.chopper
        url = open("https://onepiece.fandom.com/wiki/Tony_Tony_Chopper")
        page = Nokogiri::HTML(url)
        chopper = page.css(".mw-content-text").css("p")[4..6].text
        chopper.gsub(/\[.*?\]/, "").colorize(:blue)
    end

    def self.robin
        url = open("https://onepiece.fandom.com/wiki/Nico_Robin")
        page = Nokogiri::HTML(url)
        robin = page.css(".mw-content-text").css("p")[4..7].text
        robin.gsub(/\[.*?\]/, "").colorize(:blue)
    end

    def self.franky
        url = open("https://onepiece.fandom.com/wiki/Franky")
        page = Nokogiri::HTML(url)
        franky = page.css(".mw-content-text").css("p")[4..7].text
        franky.gsub(/\[.*?\]/, "").colorize(:magenta)
    end

    def self.brook
        url = open("https://onepiece.fandom.com/wiki/Brook")
        page = Nokogiri::HTML(url)
        brook = page.css(".mw-content-text").css("p")[4..7].text
        brook.gsub(/\[.*?\]/, "").colorize(:magenta)
    end

    def self.jimbei
        url = open("https://onepiece.fandom.com/wiki/Jinbe")
        page = Nokogiri::HTML(url)
        jimbei = page.css(".mw-content-text").css("p")[1..3].text
        jimbei.gsub(/\[.*?\]/, "").colorize(:magenta)
    end
       
end

