class Devilfruit
    
attr_accessor :name, :bio, :url, :start_i, :end_i
@@all = []
    
    def initialize(name, url)
        @name = name
        @url = url
        @@all << self
    end

    def self.all
        @@all
    end

end
