require 'pry'
require_relative './scraper.rb'
class Devilfruit

attr_accessor :name, :bio
@@all = []
    
    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    # def self.find_by_bio(bio)
    #     character = @@all.filter do |c|
    #         c.bio == bio
    #     end
    # end


end

        paramecia = Devilfruit.new("Paramecia")
        zoan = Devilfruit.new("Zoan")
        logia = Devilfruit.new("Logia")

        paramecia.bio=(Scraper.paramecia)
        zoan.bio=(Scraper.zoan)
        logia.bio=(Scraper.logia)
        #binding.pry