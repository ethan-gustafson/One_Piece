shared_examples_for("character_devil_fruit") do # share_examples_for allows you to contain code used in multiple spec tests
  it "Have attributes for :bio, :start_i, :end_i" do # that share the same functionality
    expect(subject).to respond_to(:bio, :start_i, :end_i) # which is why we can even use subject here so that we don't hard-code
  end # class names the describe blocks are using for the spec test

  it ":start_i and :end_i must be integers" do
    subject.start_i = 2
    subject.end_i = 4
    expect(subject.start_i).to be_an(Integer)
    expect(subject.end_i).to be_an(Integer)
  end

  it "includes Instance Methods Module" do
    expect(described_class.included_modules).to include(OPData::InstanceMethods)
  end
end