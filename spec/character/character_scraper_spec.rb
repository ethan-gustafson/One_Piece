require_relative "../spec_helper.rb"
describe CharacterScraper do
  it ".characters" do
    all_characters_scrape = ScraperHelper.obj_to_arr_of_hashes(Character.all)
    old_character_read = eval(ScraperHelper.read_file("./data/characters.txt"))
    expect(all_characters_scrape).to eq(old_character_read)
  end
end