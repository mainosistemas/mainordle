require "mainordle/dictionary"

module Mainordle
  class Game
    def initialize(dictionary, winner_word)
      @tries = []
      @dictionary = dictionary
      @winner_word = winner_word

      unless @dictionary.includes_word?(@winner_word)
        raise ArgumentError, "winner word does not exist in the dictionary"
      end
    end

    def has_won?
      return false if @tries.empty?

      @dictionary.includes_word?(@tries.last)
    end

    def has_lost?
      @tries.size > 5
    end

    def words_tried
      @tries
    end

    def add_try(word)
      if @dictionary.includes_word? word
        @tries << word
      else
         raise ArgumentError, "word is not in the dictionary"
      end
    end
  end
end
