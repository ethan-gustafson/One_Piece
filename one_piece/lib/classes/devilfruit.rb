require 'pry'

class DevilFruit

    attr_accessor :type, :name
    @@all = []

    def initialize(type, name)
        @type = type
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

end
