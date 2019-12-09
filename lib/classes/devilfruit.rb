require 'pry'
require_relative './scraper.rb'
class Devilfruit

attr_accessor :name, :bio
@@all = []
    
    def initialize(name)
        @name = name
        @@all << self
    end

    def self.fruits
        paramecia = Devilfruit.new("1. Paramecia")
            paramecia.bio=(Scraper.paramecia)

        zoan = Devilfruit.new("2. Zoan")
            zoan.bio=(Scraper.zoan)

        logia = Devilfruit.new("3. Logia")
            logia.bio=(Scraper.logia)
            @@all << self
    end

    def self.all
        @@all
    end

end

#binding.pry