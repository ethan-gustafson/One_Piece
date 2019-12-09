require 'pry'
require_relative './scraper.rb'
class Character

attr_accessor :name, :bio
@@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.characters
        luffy = Characters.new("Monkey D. Luffy")
            luffy.bio=(Scraper.luffy.text)

        zoro = Characters.new("Roronoa Zoro")
            zoro.bio=(Scraper.zoro.text)
                
        nami = Characters.new("Nami")
            nami.bio=(Scraper.nami.text)

        usopp = Characters.new("Usopp")
            usopp.bio=(Scraper.usopp.text)  

        sanji = Characters.new("Vinsmoke Sanji")
            sanji.bio=(Scraper.sanji.text)     

        chopper = Characters.new("Tony Tony Chopper")   
            chopper.bio=(Scraper.chopper.text)   

        robin = Characters.new("Nico Robin")  
            robin.bio=(Scraper.robin.text)   

        franky = Characters.new("Franky") 
            franky.bio=(Scraper.franky.text) 

        brook = Characters.new("Brook")
            brook.bio=(Scraper.brook.text)   

        jimbei = Characters.new("Jimbei")
            jimbei.bio=(Scraper.jimbei.text)
            
        @@all << self
    end

    def self.all
        @@all
    end

end

#binding.pry