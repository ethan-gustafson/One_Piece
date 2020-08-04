require_relative '../lib/classes/character.rb'

describe Character do

    context "attributes" do

        subject { Character.new("Luffy", "https://onepiece.fandom.com/wiki/Monkey_D._Luffy") } 

        it "Instantiate with a name & URL" do
            expect(subject).to have_attributes(:name => "Luffy", :url => "https://onepiece.fandom.com/wiki/Monkey_D._Luffy")
        end

        it "Have attributes for :bio, :start_i, :end_i" do
            expect(subject).to respond_to(:bio, :start_i, :end_i)
        end

        it ":name, :url & :bio must be strings" do
            subject.bio = "Kaizoku-ō ni ore wa naru!"
            expect(subject.name).to be_an(String)
            expect(subject.url).to be_an(String)
            expect(subject.bio).to be_an(String)
        end

        it ":start_i and :end_i must be integers" do
            subject.start_i = 2
            subject.end_i = 4
            expect(subject.start_i).to be_an(Integer)
            expect(subject.end_i).to be_an(Integer)
        end
        
    end

    context 'class Methods' do
        it '.all method which will record all instances of the class' do
            expect(Character.all).to be_an(Array)
        end
    end
    
end