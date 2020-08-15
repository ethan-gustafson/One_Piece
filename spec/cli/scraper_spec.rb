require_relative '../../lib/classes/scraper.rb'
require 'nokogiri'
require 'open-uri'
require 'colorize'

describe Scraper do

    it ".summary scrapes the show summary" do
        url = "https://en.wikipedia.org/wiki/List_of_One_Piece_characters"
        scraped_data = Nokogiri::HTML(URI.open(url))
        summary = scraped_data.css(".mw-parser-output p")[0].text.strip.gsub(/\[.*?\]/, "")
        expect(Scraper.summary).to eq(summary)
    end

    it ".haki scrapes information about Haki" do
        url = "https://onepiece.fandom.com/wiki/Haki"
        scraped_data = Nokogiri::HTML(URI.open(url))
        haki = scraped_data.css(".mw-content-text").css("p")[0].text.gsub(/\[.*?\]/, "")
        expect(Scraper.haki).to eq(haki)
    end

    it ".fruits_info scrapes what devil fruits are" do
        url = "https://myanimelist.net/featured/538/Devil_Fruit__Defintion_Types_and_Users"
        scraped_data = Nokogiri::HTML(URI.open(url))
        fruits_info = scraped_data.css(".wrapper").css("p")[0..4].text
        expect(Scraper.fruits_info).to eq(fruits_info)
    end

    xit ".all_fruits scrapes a list of fruits" do
        
    end

    xit ".grab_fruitsbio scrapes the bio of the specific fruit" do
        
    end

    xit ".all_characters scrapes a list of characters" do
        
    end

    xit ".grab_bio scrapes the specific character bio" do
        
    end

    xit ".all_char_and_all_fruits calls .all_characters & .all_fruits" do
        
    end

    xit ".episode_list scrapes how many episodes there are" do
        
    end
    
end