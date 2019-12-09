require 'pry'
class Arcs

    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.make_arcs
        Scraper.arcs.each do |arc|
            Arcs.new(arc)
            @@all << self
        end
    end

end
