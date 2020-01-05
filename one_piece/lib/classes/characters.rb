require 'pry'

class Characters

    attr_accessor :name, :abilities, :fruit_users
    @@all = []
   
    def initialize(name, abilities)
        @name = name
        @abilities = abilities
        @fruit_users = []
        @@all << self
    end

    def self.all
        @@all
    end

    def fruit_users
        #should be able to call Characters.fruit_users and return an array of characters that use devil fruits.
    end

end