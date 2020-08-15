require_relative '../../config/environment.rb'

describe CLI do
    
    it "Is able to connect to the internet" do
        expect(URI.open("https://www.google.com/")).not_to be_falsey
    end

    context ".call" do
        
        xit "calls .scrape" do
            # expect(CLI.call).to receive(:scrape)
        end

        xit "calls .menu_start" do
            # expect(CLI.call).to receive(:menu_start)
        end
    end

    context ".scrape" do
        
        it "calls Scraper.all_char_and_all_fruits" do
            expect(CLI.scrape.count).to eq(2)
        end

    end

    context ".menu_start" do

        xit "calls Menu.new" do
            
        end

    end

end