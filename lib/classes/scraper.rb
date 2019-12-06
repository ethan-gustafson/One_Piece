require 'open-uri'
require 'nokogiri'
require 'pry'
require_relative './characters.rb'
require_relative './devilfruit.rb'
class Scraper

    #attr_reader :fruit_types
    def char_page
        html = "https://en.wikipedia.org/wiki/List_of_One_Piece_characters"
    end

    def fruits_page
        html = "https://aminoapps.com/c/one-piece/page/blog/list-of-devil-fruits/Zbdk_amHBu02RK58QjPn2Xd5LvJvdoM3Xk"
    end

    def haki_page
        html = "https://onepiece.fandom.com/wiki/Haki"
    end

    def self.all_characters
        url = open(self.char_page)
        page = Nokogiri::HTML(url)
        #onepiece_bio = page.css(".mw-content-ltr p")[0].text - iteration with name and bio all at once 
        #onepiece_bio.chomp("\n").delete"\""
        characters_array = page.css(".mw-headline")
        characters_array[2..90].each_with_index do |character, index|
            puts "#{index}. #{character.name}"
        #c = Characters.new every iteration creates new character, assign bio same time
    end 

    def fruit_types_list
        url = open(self.fruits_page)
        page = Nokogiri::HTML(url)
        logia_fruit = page.css("p.italic.bolder")[1].text.chomp(" -")
        paramecia_fruit = page.css("p.italic.bolder")[13].text.chomp("-")
        zoan_fruit = ("p.italic.bolder")[19].text.chomp.(" -")

        devil_fruits = page.css(".content.rich-content.article")[0].text.strip.split("•")
        devil_fruits.shift
        devil_fruits
    end #Done

    def haki_types

    end

end

#connecting the href link
#page.css("a").attr("href").value