module InstanceMethods
        
    attr_accessor(:name, :bio, :url, :start_i, :end_i)

    def initialize(name, url)
        @name = name
        @url = url
        self.class.all << self
    end

end