require 'pry'
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

    def make_bios

    end

end
#binding.pry


