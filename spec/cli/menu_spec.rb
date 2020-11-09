require_relative "../spec_helper.rb"
describe Menu do

    context "#initialize" do
      it "outputs a menu" do
        setup_fake_input("exit")
        output = capture_output{ subject }
        expect(output).to include("Welcome to One Piece!")
      end
    end

  context "methods" do
    it "#list_options lists menu options" do
      setup_fake_input("exit")
      output = capture_output{ subject.list_options }
      expect(output).to include("To quit, type 'exit' or hit enter.")
    end

    it "#user_input takes in user input" do
      setup_fake_input("exit")
      output = capture_output{ subject.user_input }
      expect(output).to include("Goodbye!")
    end

    it "#display will take an object as an argument and output its resources" do
      setup_fake_input("exit")
      no_output{ subject.user_input }
      expect(subject).to receive(:display).with(Class)
      subject.display(Character)
    end

    it "#object_menu lets user choose which resource they would like to view" do
      setup_fake_input("exit")
      no_output{ subject.user_input }
      allow(subject).to receive(:display).with(DevilFruit)
      expect(subject).to receive(:object_menu).with(DevilFruit, "1")
      subject.object_menu(DevilFruit, "1")
    end
  end
end