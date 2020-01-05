require 'open-uri'
require 'nokogiri'
require 'pry'
require_relative './characters.rb'

class Scraper

    #attr_reader :fruit_types
    def char_page
        html = "https://en.wikipedia.org/wiki/List_of_One_Piece_characters"
    end

    def fruits_page
        html = "https://aminoapps.com/c/one-piece/page/blog/list-of-devil-fruits/Zbdk_amHBu02RK58QjPn2Xd5LvJvdoM3Xk"
    end

    def anime_bio
        url = open(self.char_page)
        page = Nokogiri::HTML(url)
        onepiece_bio = page.css(".mw-content-ltr p")[0].text
        onepiece_bio.chomp("\n").delete"\""
    end #done
    
    def all_characters
        url = open(self.char_page)
        page = Nokogiri::HTML(url)
        characters_array = page.css(".mw-headline")
        characters_array[2..90].text.strip
    end #needs delimiters to be done

   # def make_characters
    #    self.all_characters.each do |character|
     #   character = Characters.new
      #  character.name = 
       # character.abilities = 
    #end #needs to assign character instances to 

    #def fruits_bio
     #   url = open(self.fruits_page)
      #  page = Nokogiri::HTML(url)

    #end

    def fruit_types
        url = open(self.fruits_page)
        page = Nokogiri::HTML(url)
        logia = page.css("p.italic.bolder")[1].text.chomp(" -"),
        paramecia = page.css("p.italic.bolder")[13].text.chomp("-"),
        zoan = ("p.italic.bolder")[19].text.chomp.(" -")
    end

    #def fruits_list
     #   url = open(self.fruits_page)
      #  page = Nokogiri::HTML(url)
       # devil_fruits = page.css
    #end

    #def character_bios(html = "https://en.wikipedia.org/wiki/List_of_One_Piece_characters")
     # url = open(html)
      #page = Nokogiri::HTML(url)
      #character_bios = page.css

end