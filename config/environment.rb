#!/usr/bin/env ruby
require 'bundler'
Bundler.require

# require necessary gems & paths
['nokogiri', 'open-uri', 'colorize', 'readline', 'pry'].each do |gem|
  require gem
end

require_all 'lib/modules'
require_all 'lib/classes'