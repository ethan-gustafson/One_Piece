require 'require_all'; require 'nokogiri'; require 'open-uri'
require 'pry'; require_rel ("../../lib")

class ScrapedData < Scraper

  def initialize
    super
    write_strings_to_files
    write_arrays_to_files
  end

  def write_strings_to_files
    File.write(File.join(".", "data", "episodes.txt"), @episode_list)
    File.write(File.join(".", "data", "fruits_info.txt"), @fruits_info)
    File.write(File.join(".", "data", "haki.txt"), @haki)
    File.write(File.join(".", "data", "summary.txt"), @summary)
  end

  def write_arrays_to_files
    File.write(File.join(".", "data", "characters.txt"), obj_to_arr_of_hashes(@characters))
    File.write(File.join(".", "data", "fruits.txt"), obj_to_arr_of_hashes(@fruits))
  end

  def obj_to_arr_of_hashes(obj)
    arr = []
    obj.each do |e|
      hash = {}
      e.instance_variables.each do |v|
        hash[v[1..-1].to_sym] = e.instance_variable_get(v)
      end
      arr.push(hash)
    end
    arr
  end
end