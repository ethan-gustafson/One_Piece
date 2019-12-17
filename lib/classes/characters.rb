class Character

attr_accessor :name, :bio, :url, :num_bios
@@all = []

    def initialize(name, url, num_bios)
        @name = name
        @url = url
        @num_bios = num_bios
        @@all << self
    end

    def self.all
        @@all
    end

end

# luffy = Character.new("Monkey D. Luffy")
# luffy.bio=(Scraper.make_char("Monkey_D._Luffy", 4, :red))

# zoro = Character.new("Roronoa Zoro")
# zoro.bio=(Scraper.zoro)
    
# nami = Character.new("Nami")
# nami.bio=(Scraper.nami)

# usopp = Character.new("Usopp")
# usopp.bio=(Scraper.usopp)  

# sanji = Character.new("Vinsmoke Sanji")
# sanji.bio=(Scraper.sanji)     

# chopper = Character.new("Tony Tony Chopper")   
# chopper.bio=(Scraper.chopper)   

# robin = Character.new("Nico Robin")  
# robin.bio=(Scraper.robin)   

# franky = Character.new("Franky") 
# franky.bio=(Scraper.franky) 

# brook = Character.new("Brook")
# brook.bio=(Scraper.brook)   

# jimbei = Character.new("Jimbei")
# jimbei.bio=(Scraper.jimbei)

# #Maybe creating a class method
# #He said I shouldn't be instantiating new objects with the scraper? 
# #For Example: is connecting the bio to the object 'luffy' instantiating that object with a bio?
# #One very generic method that scrapes characters instead of listing them one by one?
# #When the user inputs a number it will find the character, and pass that url to the scraper and scrape it just for
# #that character?
# #Why not have them like this, so that the object will always have the bio regardless?
# #Even if the webpage changes, it would be the same as having a different method that contains
# #All of the bios. I'd either still have to connect that method to the bio down here past the class, or iterate
# #through these objects.