require "spec_helper"

describe Mainordle::Game do
  describe "#initialize" do
    context "when the winner word does not exist in the dictionary" do
      it "raises an ArgumentError" do
        expect do
          setup_game(dictionary_words: [], winner_word: "happy")
        end.to raise_error(ArgumentError, "winner word does not exist in the dictionary")
      end
    end
  end

  describe "#has_won?" do
    context "when there were no tries" do
      it "returns false" do
        game = setup_game(dictionary_words: ["teste"], winner_word: "teste")

        expect(game).not_to have_won
      end
    end

    context "#guesses_word" do
      it "returns game won" do
        winner_word = Mainordle::Word.new("teste")
        game = setup_game(dictionary_words: ["teste"], winner_word: "teste")

        game.add_try(winner_word)

        expect(game).to have_won
      end
    end
  end

  describe "#words_tried" do
    context "when there were no tries" do
      it "returns an empty array" do
        game = setup_game(dictionary_words: ["teste"], winner_word: "teste")

        expect(game.words_tried).to eq []
      end
    end
  end

  describe "#add_try" do
    context "when the word exists in the dictionary" do
      it "adds a try to the game" do
        game = setup_game(dictionary_words: ["teste"], winner_word: "teste")

        game.add_try(Mainordle::Word.new("teste"))

        expect(game.words_tried).to include Mainordle::Word.new("teste")
      end
    end

    context "when the word does not exist in the dictionary" do
      it "raises an ArgumentError" do
        game = setup_game(dictionary_words: ["happy"], winner_word: "happy")

        expect do
          game.add_try(Mainordle::Word.new("teste"))
        end.to raise_error(ArgumentError, "word is not in the dictionary")
      end
    end
  end

  describe "#has_lost?" do
    context "when there was one try" do
      it "returns false" do
        game = setup_game(dictionary_words: ["teste"], winner_word: "teste")

        game.add_try(Mainordle::Word.new("teste"))

        expect(game).not_to have_lost
      end
    end

    context "when there were 5 tries" do
      it "returns false" do
        game = setup_game(dictionary_words: ["teste"], winner_word: "teste")

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
        game = setup_game(dictionary_words: ["teste"], winner_word: "teste")

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

  def setup_game(dictionary_words:, winner_word:)
    dictionary = Mainordle::Dictionary.new(dictionary_words.map { |w| Mainordle::Word.new(w) })
    described_class.new(dictionary, Mainordle::Word.new(winner_word))
  end
end
