require 'pry'
require_relative './scraper.rb'
require_relative './characters.rb'

class DevilFruit

    attr_accessor :type, :fruit_name, :character
    @@all = []

    def initialize(type, fruit_name)
        @type = type
        @fruit_name = fruit_name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_by_name(fruit_name)
        DevilFruit.all.find{|fruit| fruit.fruit_name == fruit_name}
    end

    def self.list(input)
        if input == 1


end


