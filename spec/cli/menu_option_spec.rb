require_relative '../../config/environment.rb'

describe MenuOption do

    it ".summary method returns the summary scraped from Scraper.summary" do
        expect(MenuOption.summary).to eq(Scraper.summary)
    end

    it ".episodes returns the episode count of One Piece from Scraper.episode_list" do
        expect(MenuOption.episodes).to eq(Scraper.episode_list)
    end

    it ".where_to_watch returns where you can currently watch the tv show" do
        expect(MenuOption.where_to_watch).to eq("You can find One Piece on Crunchyroll, Funimation or Hulu!".colorize(:light_red))
    end

    xit ".characters gives the user the option to choose information about the ten members of the One Piece crew" do
        # We are testing to see if the method lets the user see the info
    end

    xit ".fruits" do
        # We are testing to see if the method lets the user see the info
    end

    it ".haki" do
        expect(MenuOption.haki).to eq(Scraper.haki)
    end
    
end