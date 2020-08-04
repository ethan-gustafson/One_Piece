require_relative '../../lib/classes/character.rb'
require_relative '../../lib/classes/devil_fruit.rb'

shared_examples_for("character_devil_fruit") do 
    it "Have attributes for :bio, :start_i, :end_i" do
        expect(subject).to respond_to(:bio, :start_i, :end_i)
    end

    it ":start_i and :end_i must be integers" do
        subject.start_i = 2
        subject.end_i = 4
        expect(subject.start_i).to be_an(Integer)
        expect(subject.end_i).to be_an(Integer)
    end
end