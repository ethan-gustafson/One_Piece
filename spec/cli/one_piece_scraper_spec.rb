require_relative "../spec_helper.rb"
describe OnePieceScraper do
  it ".summary scrapes the show summary" do
    expect(OnePiece.summary).to match(ScraperHelper.read_file("./data/summary.txt"))
  end

  it ".haki scrapes information about Haki" do
    expect(OnePiece.haki_explanation).to match(ScraperHelper.read_file("./data/haki.txt"))
  end

  it ".episodes scrapes how many episodes there are" do
    expect(OnePiece.episodes).to match(ScraperHelper.read_file("./data/episodes.txt"))
  end 
end