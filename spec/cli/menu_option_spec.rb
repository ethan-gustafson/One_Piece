require_relative '../../config/environment.rb'

describe MenuOption do

    it ".summary method returns the summary scraped from Scraper.summary" do
        summary = 'The One Piece manga and anime series features an extensive cast of characters created by Eiichiro Oda.'
        expect(MenuOption.summary).to include(summary)
    end

    it ".episodes returns the episode count of One Piece from Scraper.episode_list" do
        episodes = " The series currently consists of 936 Episodes (ongoing), 4 OVAs, 13 TV specials and 14 movies."
        expect(MenuOption.episodes).to eq(episodes.colorize(:red))
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
        haki = "Haki is a mysterious power that allows the user to utilize their own spiritual energy for various purposes.\n"
        expect(MenuOption.haki).to eq(haki.colorize(:blue))
    end
    
end