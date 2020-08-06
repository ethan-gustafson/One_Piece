require_relative '../../lib/classes/cli.rb'
require 'open-uri'

describe CLI do
    
    it "Is able to connect to the internet" do
        expect(URI.open("https://www.google.com/")).not_to be_falsey
    end

end