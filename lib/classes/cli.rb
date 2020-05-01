class CLI

    def call
        Scraper.all_char
        Scraper.all_fruits
        Menu.new
    end

end
