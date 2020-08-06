class CLI

    def self.call
        Scraper.all_char_and_all_fruits
        Menu.new
    end

end
