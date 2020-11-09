require_relative "../spec_helper.rb"
describe DevilFruitScraper do
  it ".fruits_summary_scrape scrapes what devil fruits are" do
    expect(DevilFruit.fruits_summary).to match(ScraperHelper.read_file("./data/fruits_info.txt"))
  end

  it ".fruits" do
    all_fruits_scrape = ScraperHelper.obj_to_arr_of_hashes(DevilFruit.all)
    old_fruits_read = eval(ScraperHelper.read_file("./data/fruits.txt"))
    expect(all_fruits_scrape).to eq(old_fruits_read)
  end
end