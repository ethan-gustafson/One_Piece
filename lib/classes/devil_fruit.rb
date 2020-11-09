require_relative '../modules/op_data.rb'
class DevilFruit
  include OPData::InstanceMethods
  extend OPData::ClassMethods

  @@all = []

  def self.all
    @@all
  end

  def self.get_all_fruits
    DevilFruitScraper.fruits
  end

  def self.fruits_summary
    DevilFruitScraper.fruits_summary_scrape
  end
end
