class CLI

    def self.call
        Scraper.all_char
        Scraper.all_fruits
        Menu.new
    end

end
