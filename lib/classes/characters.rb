require 'pry'
require_relative './scraper.rb'
require_relative './devilfruit.rb'

class Characters

    attr_accessor :name
    @@all = []
   
    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.make_characters
        Scraper.all_characters.each do |person|
            Characters.new(person)
            @@all << self
        end
    end

    # I want to connect a character object to the scraper list.
    #I want to be able to see each character object.
        

    # def add_fruit(fruit)
    #     fruit.character = self
    # end

    # def fruit_user
    #     DevilFruit.all.select do |fruit|
    #         fruit.character == self
    #     end
    # end
    
    #def self.list

    #end
end
binding.pry


