require_relative "../spec_helper"
describe CLI do
  context "class methods" do
    it ".initialize! instantiates the application" do
      expect(CLI).to receive(:initialize!)
      CLI.initialize!
    end

    it ".display_logo outputs ASCII art of the One Piece Pirates Jolly Roger" do
      setup_fake_input("exit")
      output = capture_output{ CLI.display_logo }
      expect(output).to include("Welcome to One Piece!")
    end

    it ".initialize_menu outputs a new menu" do
      setup_fake_input("exit")
      output = capture_output{ Menu.new }
      expect(output).to include("Type 'general'")
    end
  end
end