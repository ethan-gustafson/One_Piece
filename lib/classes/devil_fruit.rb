require_relative '../modules/instance_methods.rb'
class DevilFruit
include InstanceMethods

  @@all = []

  def self.all
    @@all
  end

end
