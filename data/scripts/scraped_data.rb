require 'require_all'
require 'nokogiri'
require 'open-uri'
require 'colorize'
require 'pry'
require_relative './scraper_helper.rb'
require_rel ("../../lib")
class ScrapedData

  def initialize
    Character.get_all_characters
    DevilFruit.get_all_fruits
    write_strings_to_files
    write_arrays_to_files
  end

  def write_strings_to_files
    File.write(File.join("data", "episodes.txt"), OnePiece.episodes)
    File.write(File.join("data", "fruits_info.txt"), DevilFruit.fruits_summary)
    File.write(File.join("data", "haki.txt"), OnePiece.haki_explanation)
    File.write(File.join("data", "summary.txt"), OnePiece.summary)
  end

  def write_arrays_to_files
    File.write(File.join("data", "characters.txt"), ScraperHelper.object_to_array_of_hashes(Character.all))
    File.write(File.join("data", "fruits.txt"), ScraperHelper.object_to_array_of_hashes(DevilFruit.all))
  end
end

ScrapedData.new