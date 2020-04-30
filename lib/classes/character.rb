require_relative '../modules/instance_methods.rb'
class Character
    include InstanceMethods

    @@all = []

    def self.all
        @@all
    end

end
