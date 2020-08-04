require_relative '../../lib/classes/character.rb'
require 'shared_examples/character_devil_fruit'

describe Character do

    context "attributes" do

        subject { Character.new("Luffy", "https://onepiece.fandom.com/wiki/Monkey_D._Luffy") } 

        it "Instantiate with a name & URL" do
            expect(subject).to have_attributes(:name => "Luffy", :url => "https://onepiece.fandom.com/wiki/Monkey_D._Luffy")
        end

        it_behaves_like('character_devil_fruit')

        it ":name, :url & :bio must be strings" do
            subject.bio = "Kaizoku-ō ni ore wa naru!"
            expect(subject.name).to be_an(String)
            expect(subject.url).to be_an(String)
            expect(subject.bio).to be_an(String)
        end
        
    end

    context 'class Methods' do
        it '.all method which will record all instances of the class' do
            expect(Character.all).to be_an(Array)
        end
    end
    
end