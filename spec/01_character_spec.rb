require_relative '../lib/classes/character.rb'

describe Character do
    context "should have a class method" do
        it "which reads all instances of the class" do
            expect(Character.all).to all(be == [])
        end
    end
end