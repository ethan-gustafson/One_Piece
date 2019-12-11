require 'pry'
require_relative './scraper.rb'
class Character

attr_accessor :name, :bio
@@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

end

luffy = Character.new("Monkey D. Luffy")
luffy.bio=(Scraper.luffy)

zoro = Character.new("Roronoa Zoro")
zoro.bio=(Scraper.zoro)
    
nami = Character.new("Nami")
nami.bio=(Scraper.nami)

usopp = Character.new("Usopp")
usopp.bio=(Scraper.usopp)  

sanji = Character.new("Vinsmoke Sanji")
sanji.bio=(Scraper.sanji)     

chopper = Character.new("Tony Tony Chopper")   
chopper.bio=(Scraper.chopper)   

robin = Character.new("Nico Robin")  
robin.bio=(Scraper.robin)   

franky = Character.new("Franky") 
franky.bio=(Scraper.franky) 

brook = Character.new("Brook")
brook.bio=(Scraper.brook)   

jimbei = Character.new("Jimbei")
jimbei.bio=(Scraper.jimbei)


