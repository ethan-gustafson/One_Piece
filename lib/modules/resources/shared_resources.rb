module SharedResources
  module InstanceMethods
    attr_accessor(:name, :bio, :url, :start_i, :end_i)

    def initialize(name, url)
      @name = name
      @url = url
      self.class.all << self
    end
  end

  module ClassMethods
    def list_instances
      puts
      all.each.with_index(1) do |c, index|
        puts "#{index}. #{c.name}".colorize(:red)
      end
    end
  end
end