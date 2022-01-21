require "spec_helper"

describe Mainordle::Word do
  describe "#initialize" do
    it "is valid with 5 letters" do
      expect do
        described_class.new("letra")
      end.not_to raise_error()
    end

    context "when the word has 4 letters" do
      it "raises an ArgumentError" do
        expect do
          described_class.new("trem")
        end.to raise_error(ArgumentError, "does not have 5 letters")
      end
    end

    context "when the word has 6 letters" do
      it "raises an ArgumentError" do
        expect do
          described_class.new("musica")
        end.to raise_error(ArgumentError, "does not have 5 letters")
      end
    end

    context "when the word has a star" do
      it "raises an ArgumentError" do
        expect do
          described_class.new("vali*")
        end.to raise_error(ArgumentError, "has invalid characters")
      end
    end

    context "when the word has a dot" do
      it "raises an ArgumentError" do
        expect do
          described_class.new("vali.")
        end.to raise_error(ArgumentError, "has invalid characters")
      end
    end

    context "when the word has a number" do
      it "raises an ArgumentError" do
        expect do
          described_class.new("vali1")
        end.to raise_error(ArgumentError, "has invalid characters")
      end
    end
  end

  describe "#letters" do
    it "returns the word's letters as an array" do
      word = described_class.new("letra")

      expect(word.letters).to eq %w(l e t r a)
    end
  end
end
