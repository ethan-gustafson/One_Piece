require_relative '../modules/op_data.rb'
class DevilFruit
  include OPData::InstanceMethods
  extend OPData::ClassMethods

  @@all = []

  def self.all
    @@all
  end

end
