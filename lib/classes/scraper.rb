require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

    def self.char_page
        html = "https://en.wikipedia.org/wiki/List_of_One_Piece_characters"
    end

    def self.fruits_page
        html = "https://aminoapps.com/c/one-piece/page/blog/list-of-devil-fruits/Zbdk_amHBu02RK58QjPn2Xd5LvJvdoM3Xk"
    end

    def self.haki_page
        html = "https://myanimelist.net/featured/781/The_3_Different_Types_of_One_Piece_Haki"
    end

    def self.arcs_page
        html = "https://onepiece.fandom.com/wiki/Story_Arcs"
    end

    def self.summary
        url = open(char_page)
        page = Nokogiri::HTML(url)
        
        page.search(".mw-parser-output").map do |div|
            div.at('p').text.strip
        end  
    end#Needs delimiters

    def self.all_characters
        url = open(char_page)
        page = Nokogiri::HTML(url)
        characters_array = page.css(".mw-headline")

        characters = characters_array[2..90].collect{|character| character}
        characters.collect.with_index(1){ |character,index| "#{index}. #{character.attributes.values[1]}"}
    end

    def self.bios
        url = open(char_page)
        page = Nokogiri::HTML(url)
        bios_array = page.css(".mw-parser-output")
        

        #char_bios.each.with_index(1) do |bio|
         #   puts bio
        #end.text #This will go through each characters bio based on what input happens.
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

    def self.fruits 
        url = open(fruits_page)
        page = Nokogiri::HTML(url)
        devil_fruits = page.css(".content.rich-content.article").css(".italic").text.strip.split("•")
        devil_fruits.shift
        new_fruits = devil_fruits
        new_fruits.join(', ')
        god_fruits = new_fruits
        string = god_fruits.to_s
        variable = string.delete("~")
        var = variable.split(/\W+[\,]/)
        function = var.to_s
        ruby = function.gsub!(/[(]/, "- ")
        ruby_delete = ruby.tr('[', '')
        finally = ruby_delete.tr(']', '')
        finishing = finally.split(",")
        getrdone = finishing.to_s
        done = getrdone.gsub(":triangular_flag_on_post: THANK YOU FOR READING :triangular_flag_on_post:", "")
        done.split(",")
        #  new_fruits.collect.with_index do |fruit, index|
        #     puts "#{index}. - #{fruit}"  
        #  end  
    end#needs delimiters!!!!!!!!

    def self.haki_info
        url = open(haki_page)
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