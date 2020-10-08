require_relative "../spec_helper.rb"
describe Scraper do

  before(:context) do
    SCRAPER = Scraper.new
  end

  context "instance methods" do
    it "#get_all_characters scrapes a list of characters" do
      all_characters_scrape = ScraperHelper.obj_to_arr_of_hashes(SCRAPER.characters)
      old_character_read = eval(ScraperHelper.read_file("./data/characters.txt"))
      expect(all_characters_scrape).to eq(old_character_read)
    end

    it "#get_all_fruits scrapes a list of fruits" do
      all_fruits_scrape = ScraperHelper.obj_to_arr_of_hashes(SCRAPER.fruits)
      old_fruits_read = eval(ScraperHelper.read_file("./data/fruits.txt"))
      expect(all_fruits_scrape).to eq(old_fruits_read)
    end

    it "#get_fruits_info scrapes what devil fruits are" do
      expect(SCRAPER.fruits_info).to match(ScraperHelper.read_file("./data/fruits_info.txt"))
    end

    it "#get_summary scrapes the show summary" do
      expect(SCRAPER.summary).to match(ScraperHelper.read_file("./data/summary.txt"))
    end

    it "#get_haki scrapes information about Haki" do
      expect(SCRAPER.haki).to match(ScraperHelper.read_file("./data/haki.txt"))
    end

    it "#get_episode_list scrapes how many episodes there are" do
      expect(SCRAPER.episode_list).to match(ScraperHelper.read_file("./data/episodes.txt"))
    end 
  end
end