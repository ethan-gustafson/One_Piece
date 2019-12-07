require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

    def char_page
        html = "https://en.wikipedia.org/wiki/List_of_One_Piece_characters"
    end

    def fruits_page
        html = "https://aminoapps.com/c/one-piece/page/blog/list-of-devil-fruits/Zbdk_amHBu02RK58QjPn2Xd5LvJvdoM3Xk"
    end

    def haki_page
        html = "https://myanimelist.net/featured/781/The_3_Different_Types_of_One_Piece_Haki"
    end

    def arcs_page
        html = "https://onepiece.fandom.com/wiki/Story_Arcs"
    end

    def summary
        url = open(self.char_page)
        page = Nokogiri::HTML(url)
        
        page.search(".mw-parser-output").map do |div|
            div.at('p').text.strip
        end  
    end#Needs delimiters

    def all_characters
        url = open(self.char_page)
        page = Nokogiri::HTML(url)
        characters_array = page.css(".mw-headline")

        characters_array[2..90].each.with_index(1) do |character,index|
            puts "#{index}. #{character.attributes.values[1]}"
        end#done
    end

    def bios
        url = open(self.char_page)
        page = Nokogiri::HTML(url)
        sorted = page.css(".mw-parser-output").text.split(".")
        char_bios = sorted

        char_bios.each.with_index(1) do |bio|
            puts bio
        end.text #This will go through each characters bio based on what input happens.
    end
    #input = gets.strip.to_i

         #if characters.include?(input)
          #  index = characters[input - 1]
           # Scraper.new.bios.each do |bio|
            #    puts bio

         #elsif input < 1 || input > 89 || input == " "
          #  puts "Oops! Make sure you choose a number from 1-89!"
           # return menu
            #end
        #end

    def fruits 
        url = open(self.fruits_page)
        page = Nokogiri::HTML(url)
        devil_fruits = page.css(".content.rich-content.article").css(".italic").text.strip.split("•")
        devil_fruits.shift
        new_fruits = devil_fruits
        # new_fruits.join(', ')
        # god_fruits = new_fruits
        # string = god_fruits.to_s
        # shit = string.delete("~")
        # shit
        # .collect.with_index do |fruit, index|
        #    puts "#{index}. - #{fruit}"  
        # end  
    end#needs delimiters!!!!!!!!

    def haki_info
        url = open(self.haki_page)
        page = Nokogiri::HTML(url)
        sections = page.css(".content.clearfix.featured-article-body").css("h1").text
        #sections.collect.with_index(1) {|haki, index| puts "#{index}. #{haki}"}
    end #Needs delimiter polishiing

end
binding.pry

#connecting the href link
#page.css("a").attr("href").value


#devil_fruits.collect do |fruit|
#fruit.chomp("*")
#end