require "spec_helper"

describe Mainordle::Dictionary do

  describe "#includes_word?" do
    context " when a word is in the dictionary" do
      it "returns OK" do
        dictionary = described_class.new([Mainordle::Word.new("teste")])

        expect(dictionary.includes_word?(Mainordle::Word.new("teste"))).to be_truthy
      end
    end

    context " when a word is not in the dictionary" do
      it "returns FALSE" do
        dictionary = described_class.new([Mainordle::Word.new("teste")])

        expect(dictionary.includes_word?(Mainordle::Word.new("peixe"))).to be_falsey
      end
    end
  end

  describe "#words_count" do
    context "when the dictionary is empty" do
      it "returns 0" do
        dictionary = described_class.new([])

        expect(dictionary.words_count).to eq 0
      end
    end

    context "when the dictionary has one word" do
      it "returns 1" do
        dictionary = described_class.new([Mainordle::Word.new("teste")])

        expect(dictionary.words_count).to eq 1
      end
    end

    context "when the dictionary has two words" do
      it "returns 2" do
        teste = Mainordle::Word.new("teste")
        testa = Mainordle::Word.new("testa")

        dictionary = described_class.new([teste, testa])

        expect(dictionary.words_count).to eq 2
      end
    end
  end
end
