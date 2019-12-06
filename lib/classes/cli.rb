require 'pry'
require_relative './characters.rb'
require_relative './devilfruit.rb'
require_relative './gif.rb'

class OnePiece::CLI

    def call

        puts ""
        puts "Welcome to One Piece!"
        puts "
        _____________¶¶¶¶¶¶¶¶¶¶¶¶¶
        _____________¶¶___________¶¶
        ______________¶____________¶
        ______________¶_____________¶
        _______________¶____________¶
        _______________¶____________¶_¶¶
        _______________¶__¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶
        _____¶¶¶¶¶¶¶¶¶¶¶¶¶¶______________¶
        _____¶____________¶¶_____________¶¶____¶
        _____¶¶____________¶_____¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶
        ______¶______¶¶¶¶¶¶¶¶¶¶¶¶¶¶______________¶
        ______¶¶_____¶¶___________¶______________¶¶
        _______¶______¶____________¶______________¶
        _______¶______¶¶___________¶_____________¶¶
        _______¶_______¶___________¶_____________¶¶
        ______¶¶_______¶___________¶¶____________¶
        ______¶¶¶¶¶¶¶¶¶¶¶__________¶¶___________¶¶
        ___________¶_¶_¶¶________¶¶¶_____¶¶¶¶¶¶¶¶_____¶¶¶
        ___________¶_¶_¶¶¶¶¶¶¶¶¶¶¶_¶¶¶¶¶¶¶_______¶¶¶¶¶__¶¶
        ¶¶¶¶¶¶_____¶_¶______¶¶_¶_______¶_¶¶¶¶¶¶¶¶¶___¶¶¶¶¶
        ¶¶___¶¶¶¶¶¶¶¶¶______¶¶_¶____¶¶¶¶¶¶¶________¶¶
        __¶¶________¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶____¶¶______¶
        ____¶____________________________¶¶_¶____¶
        _____¶_____¶¶¶_____¶¶_____¶¶¶_____¶¶¶___¶¶
        ______¶___¶¶_¶¶___¶¶_¶____¶_¶¶__________¶
        ______¶¶____¶¶_____¶¶¶_____¶¶__________¶¶
        _______¶¶_____________________________¶¶
        ________¶¶___________________________¶¶
        _________¶¶________________________¶¶¶
        ___________¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶"
        puts ""
        menu
    end

    def menu
        
        input = " "
        while input != "exit"

            puts ""
            puts "To see a summary of the show, type 'summary'."
            puts "Type 'length' to see how many episodes there are in One Piece!"
            puts "Type 'arcs' to see each story arc of One Piece!"
            puts "Type 'characters' if you would like to see the list of characters!"
            puts "Type 'fruits' if you would lke to see a list of all known Devil Fruits!"
            puts "Type 'haki' to see what Haki is!"
            puts "Type 'where' if you would like to know where to watch One Piece!"
            puts "To quit, type 'exit'."
            input = gets.strip
        
            case input

            when 'summary'
                puts ""
                summary

            when 'length'
                puts ""
                episodes

            when 'arcs'
                puts ""
                arcs

            when 'characters'
                puts ""
                characters

            when 'fruits'
                puts ""
                fruits

            when 'haki'
                puts ""
                puts haki

            when 'where'
                puts ""
                where_to_watch
            
            end
        end
    end

    def summary
        Scraper.new.summary
    end

    def episodes
        puts "There are 913 episodes as of December 7th, 2019."
    end

    def where_to_watch
        puts "You can find One Piece on Crunchyroll, Funimation or Hulu!"
    end

    def characters
         characters = Scraper.new.all_characters
         puts ""
         puts "Hit a number from 1-89 to see a character/groups bio!"
         input = gets.strip.to_i

         if characters.include?(input)
            index = characters[input - 1]
            Scraper.new.bios.each do |bio|
                puts bio

         #elsif input < 1 || input > 89 || input == " "
          #  puts "Oops! Make sure you choose a number from 1-89!"
           # return menu
            end
        end
    end

    #def arcs
    #    lists arcs by index
     #   puts "Type a number from 1 to whatever to see more about that arc!"
     #   
    #end

    def fruits
        devil_fruits = ["Logia", "Paramecia", "Zoan"]
        devil_fruits.each.with_index(1) do |fruit, index|
            puts "#{index}. #{fruit}"
        end
        puts "Choose a number to see which characters have those kinds of fruits!"
    end # need to add a description of the fruit abilities, and to assign characters to fruits

    def haki
        Scraper.new.haki_info
    end

end

          #here is a reference for choosing a character or fruit from the music CLI
#def play_song
#puts "Which song number would you like to play?"
#alphabet_songs = Song.all.sort{ |a, b| a.name <=> b.name }.uniq
#input = gets.strip.to_i
#if (1..Song.all.uniq.length).include?(input)
 # song = alphabet_songs[input - 1]
  #puts "Playing #{song.name} by #{song.artist.name}"
#end
#end

                        #here is a reference from the student scraper CLI
#def display_students
 #   Student.all.each do |student|
  #    puts "#{student.name.upcase}".colorize(:blue)
   #   puts "  location:".colorize(:light_blue) + " #{student.location}"
    #  puts "  profile quote:".colorize(:light_blue) + " #{student.profile_quote}"
     # puts "  bio:".colorize(:light_blue) + " #{student.bio}"
      #puts "  twitter:".colorize(:light_blue) + " #{student.twitter}"
      #puts "  linkedin:".colorize(:light_blue) + " #{student.linkedin}"
      #puts "  github:".colorize(:light_blue) + " #{student.github}"
      #puts "  blog:".colorize(:light_blue) + " #{student.blog}"
      #puts "----------------------".colorize(:green)
    #end
  #end
#binding.pry