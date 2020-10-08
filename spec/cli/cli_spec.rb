require_relative "../spec_helper"
describe CLI do
  context "#initialize" do
    it "instantiates the application" do
      expect(CLI).to receive(:new).with(Menu)
      CLI.new(Menu)
    end
  end
end