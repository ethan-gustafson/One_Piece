require_relative '../../modules/resources/shared_resources.rb'
class DevilFruit
  include SharedResources::InstanceMethods
  extend SharedResources::ClassMethods

  @@all = []

  def self.all
    @@all
  end
end
