require "spec_helper"

describe Mainordle::Word do
  it "is valid with 5 letters" do
    word = described_class.new("letra")

    expect(word).to be_valid
  end

  it "is not valid with 4 letters" do
    word = described_class.new("trem")

    expect(word).not_to be_valid
  end

  it "is not valid with 6 letters" do
    word = described_class.new("musica")

    expect(word).not_to be_valid
  end
end
