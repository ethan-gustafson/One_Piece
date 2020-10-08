require_relative "../spec_helper"
describe Character do

  context "attributes" do
    # Subject is just the starting describe argument name
    subject { Character.new("Luffy", "https://onepiece.fandom.com/wiki/Monkey_D._Luffy") } 

    it "Instantiate with a name & URL" do
      expect(subject).to have_attributes(
        name: "Luffy", 
        url: "https://onepiece.fandom.com/wiki/Monkey_D._Luffy"
      )
    end

    # it_behaves_like will essentially 'copy' and 'paste' the code in character_devil_fruit right here
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
      expect(Character).to receive(:all).and_return(Array)
      Character.all.class
    end

    it '.list_instances method will output index and name of Character' do
      expect(Character).to receive(:list_instances).and_return(Array)
      Character.list_instances.class
    end
  end
end