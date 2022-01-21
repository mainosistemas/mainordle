require "spec_helper"

describe Mainordle::Game do
  describe "#has_won?" do
    context "when there were no tries" do
      it "returns false" do
        game = described_class.new

        expect(game).not_to have_won
      end
    end
  end

  describe "#words_tried" do
    context "when there were no tries" do
      it "returns an empty array" do
        game = described_class.new

        expect(game.words_tried).to eq []
      end
    end
  end

  describe "#add_try" do
    it "adds a try to the game" do
      game = described_class.new

      game.add_try(Mainordle::Word.new("teste"))

      expect(game.words_tried).to include Mainordle::Word.new("teste")
    end
  end

  describe "#has_lost?" do
    context "when there was one try" do
      it "returns false" do
        game = described_class.new

        game.add_try(Mainordle::Word.new("teste"))

        expect(game).not_to have_lost
      end
    end

    context "when there were 5 tries" do
      it "returns false" do
        game = described_class.new

        game.add_try(Mainordle::Word.new("teste"))
        game.add_try(Mainordle::Word.new("teste"))
        game.add_try(Mainordle::Word.new("teste"))
        game.add_try(Mainordle::Word.new("teste"))
        game.add_try(Mainordle::Word.new("teste"))

        expect(game).not_to have_lost
      end
    end

    context "when there were 6 tries" do
      it "returns true" do
        game = described_class.new

        game.add_try(Mainordle::Word.new("teste"))
        game.add_try(Mainordle::Word.new("teste"))
        game.add_try(Mainordle::Word.new("teste"))
        game.add_try(Mainordle::Word.new("teste"))
        game.add_try(Mainordle::Word.new("teste"))
        game.add_try(Mainordle::Word.new("teste"))

        expect(game).to have_lost
      end
    end
  end
end
