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