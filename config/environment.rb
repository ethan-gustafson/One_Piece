#!/usr/bin/env ruby
require 'bundler'
Bundler.require

# require necessary gems & paths
['readline', 'nokogiri', 'open-uri', 'colorize', 'pry'].each do |gem|
  require gem
end

require_relative '../lib/classes/cli.rb'