require_relative '../modules/instance_methods.rb'
class Devilfruit
    include InstanceMethods

    @@all = []

    def self.all
        @@all
    end

end
