require_relative '../../modules/scraper/scraper.rb'
class GeneralInfoScraper
  extend Scraper::ClassMethods

  def self.summary
    page = Nokogiri::HTML(URI.open("https://en.wikipedia.org/wiki/List_of_One_Piece_characters"))
    summary_css = page.css(".mw-parser-output p")[0]
    summary_info = 
      if !valid_scrape?(page, summary_css)
        display_previous_data("summary")
      else
        "\n#{summary_css.text.strip.gsub(/\[.*?\]/, '')}"
      end
    return summary_info
  end

  def self.episodes
    page = Nokogiri::HTML(URI.open("https://onepiece.fandom.com/wiki/Episode_Guide"))
    ep_css = page.css("#mw-content-text").css("p")[0]
    episodes_info = 
      if !valid_scrape?(page, ep_css)
        display_previous_data("episodes")
      else
        "\n#{ep_css.text.split(".")[1].to_s.strip}"
      end
    return episodes_info
  end

  def self.haki
    page = Nokogiri::HTML(URI.open("https://onepiece.fandom.com/wiki/Haki"))
    haki_css = page.css("#mw-content-text").css("p")[1]
    haki_info = 
      if !valid_scrape?(page, haki_css)
        display_previous_data("haki")
      else
        "\n#{haki_css.text.slice(0, haki_css.text.length - 2).gsub(/\[.*?\]/, '')}"
      end
    return haki_info
  end
end