require_relative "../spec_helper.rb"

describe DevilFruit do

  context "attributes" do

    subject { DevilFruit.new("Logia", "https://onepiece.fandom.com/wiki/Logia") } 

    it "Instantiate with a name & URL" do
      expect(subject).to have_attributes(
        name: "Logia", 
        url: "https://onepiece.fandom.com/wiki/Logia"
      )
    end

    it_behaves_like('character_devil_fruit')

    it ":name, :url & :bio must be strings" do
      subject.bio = "This type allows the user to completely alter their form into a natural element and manipulate it at will."
      expect(subject.name).to be_an(String)
      expect(subject.url).to be_an(String)
      expect(subject.bio).to be_an(String)
    end

  end

  context 'class Methods' do
    it '.all method which will record all instances of the class' do
      expect(DevilFruit.all).to be_an(Array)
    end
  end
    
end