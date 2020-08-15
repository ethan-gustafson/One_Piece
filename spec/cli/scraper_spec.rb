require_relative '../../config/environment.rb'

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

    it ".all_fruits scrapes a list of fruits" do
        expect(Scraper.all_fruits.count).to eq(6)
    end

    xit ".grab_fruitsbio scrapes the bio of the specific fruit" do
        
    end

    it ".all_characters scrapes a list of characters" do
        expect(Scraper.all_characters.count).to eq(10)
    end

    xit ".grab_bio scrapes the specific character bio" do
        
    end

    xit ".all_char_and_all_fruits calls .all_characters & .all_fruits" do
        
    end

    it ".episode_list scrapes how many episodes there are" do
        url = "https://onepiece.fandom.com/wiki/Episode_Guide"
        scraped_data = Nokogiri::HTML(URI.open(url))
        ep = scraped_data.css(".mw-content-text").css("p")[0].text.split('.')
        episode_count = ep[1].to_s + ('.')
        expect(Scraper.episode_list).to eq(episode_count)
    end
    
end