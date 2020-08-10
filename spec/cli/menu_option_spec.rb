require_relative '../../config/environment.rb'

describe MenuOption do

    it ".summary method returns the summary scraped from Scraper.summary" do
        summary = 'The One Piece manga and anime series features an extensive cast of characters created by Eiichiro Oda. The series takes place in a fictional universe where vast numbers of pirates, soldiers, revolutionaries, and other adventurers fight each other, using various superhuman and supernatural abilities. The majority of the characters are human, but the cast also includes giants, mermen and mermaids, fish-men, sky people, and minks, among others. Many of the characters possess supernatural abilities gained by eating so-called "Devil Fruits". The series\' storyline follows the adventures of a group of pirates as they search for the "One Piece" treasure.'
        expect(MenuOption.summary).to eq(summary.colorize(:green))
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