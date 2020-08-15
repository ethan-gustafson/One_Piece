class CLI

    def self.call
        scrape
        menu_start
    end

    def self.scrape
        Scraper.all_char_and_all_fruits
    end

    def self.menu_start
        Menu.new
    end

end
