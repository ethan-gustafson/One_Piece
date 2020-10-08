require_relative '../modules/op_data.rb'
class Character
  include OPData::InstanceMethods
  extend OPData::ClassMethods

  @@all = []

  def self.all
    @@all
  end

end
