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

    def summary
        url = open(self.char_page)
        page = Nokogiri::HTML(url)
        sorted = page.css(".mw-parser-output").text.split(".")
        rejoin = sorted.slice(3..12).join(" ")
        summary = rejoin
        # summary = sorted[3..12]
        # summary.text
    end

    def all_characters
        url = open(self.char_page)
        page = Nokogiri::HTML(url)
        characters_array = page.css(".mw-headline")
            characters_array[2..90].each.with_index(1) do |character,index|
                puts "#{index}. #{character.attributes.values[1]}"
            end
    end

    def bios
        url = open(self.char_page)
        page = Nokogiri::HTML(url)
        sorted = page.css(".mw-parser-output").text.split(".")
            sorted.each do |bio|
                puts bio
            end.text
    end

            #onepiece_bio = page.css(".mw-content-ltr p")[0].text - iteration with name and bio all at once 
        #onepiece_bio.chomp("\n").delete"\""
        #c = Characters.new every iteration creates new character, assign bio same time
    

    #def fruit_types_list
     #   url = open(self.fruits_page)
      #  page = Nokogiri::HTML(url)
       # logia_fruit = page.css("p.italic.bolder")[1].text.chomp(" -")
        #paramecia_fruit = page.css("p.italic.bolder")[13].text.chomp("-")
        #zoan_fruit = ("p.italic.bolder")[19].text.chomp.(" -")
    #end #Done - I dont think I need this method just to scrape three word. -_-

    def all_fruits 
        url = open(self.fruits_page)
        page = Nokogiri::HTML(url)
        devil_fruits = page.css(".content.rich-content.article")[0].text.strip.split("•")
        devil_fruits.shift
        devil_fruits
    end

    def haki_types
        url = open(self.haki_page)
        page = Nokogiri::HTML(url)
    end

end
binding.pry

#connecting the href link
#page.css("a").attr("href").value