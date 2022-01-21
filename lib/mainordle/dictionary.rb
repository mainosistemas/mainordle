require "mainordle/word"

module Mainordle
  class Dictionary
    def initialize(words)
      @words = words
    end

    def words_count
      @words.size
    end

    def includes_word?(word)
      @words.include?(word)
    end
  end
end
