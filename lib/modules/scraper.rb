module Scraper
  module ClassMethods
    def valid_scrape?(page, info)
      if page.nil? || info.nil?
        puts "\nScrape failure. Data is not up-to-date."
        return false
      else
        return true
      end
    end

    def display_previous_data(filename)
      filepath = File.join("data", "#{filename}.txt")
      File.read(filepath)
    end
  end
end