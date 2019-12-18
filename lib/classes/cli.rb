class CLI

    def call
        Effects.new.logo
        Scraper.all_char
        Scraper.all_fruits
        Menu.new.menu
    end

end
