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
     
        input = " "
        while input != "exit"
            puts ""
            puts "To see a summary of the show, type 'summary'."
            puts "Type 'length' to see how many episodes there are in One Piece!"
            puts "Type 'arcs' to see each story arc of One Piece!"
            puts "Type 'characters' if you would like to see the list of characters!"
            puts "Type 'fruit' if you would lke to see a list of all known Devil Fruits!"
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
                number_of_episodes
            when 'arcs'
                puts ""
                chosen_arc
            when 'characters'
                puts ""
                list_characters
            when 'fruit'
                puts ""
                chosen_fruit
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

    def number_of_episodes
        puts "There are 913 episodes as of December 7th, 2019."
    end

    def where_to_watch
        puts "You can find One Piece on Crunchyroll, Funimation or Hulu!"
    end

    def list_characters
        puts ""
         characters = Scraper.new.all_characters
         puts "Hit a number from 1-89 to see a character/groups bio!"
         input = gets.strip.to_i
         if characters.include?(input)
            index = characters[input - 1]
            #Scraper.new.bios.each do |bio|
             #   puts bio
            #end
         elsif input < 1 || input > 89 || input 
        end
    end

    #def chosen_character
     #   puts "Type 'more info' if you would like to know more!"
    #end

    #def chosen_arc
     #   puts "Type 'arc info' to see information regarding the arc you have chosen!"
    #end

    #def chosen_fruit
     #   puts "Type a number from the list to see the information about that fruit!"
    #end

    #def haki
        #puts "and this is Haki"
    #end

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
