require 'pry'
require_relative 'devilfruit.rb'
class Characters

    attr_accessor :name, :abilities, :fruit_users
    @@all = []
   
    def initialize(name, abilities)
        @name = name
        @abilities = abilities
        @@all << self
    end

    def self.all
        @@all
    end

    def add_fruit(fruit)
        fruit.character = self
    end

    def fruit_user
        DevilFruit.all.select do |fruit|
            fruit.character == self
        end
    end

end

#luffy = Characters.new("Monkey D. Luffy", "Armament Haki, Observation Haki, Conquering King's Haki")
#rubberfruit = DevilFruit.new("Paramecia", "Gomu Gomu no Mi(Rubber)")
#rubberfruit.character = luffy

