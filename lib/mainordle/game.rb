require "mainordle/dictionary"

module Mainordle
  class Game
    def initialize
      @tries = []
    end

    def has_won?
      false
    end

    def has_lost?
      @tries.size > 5
    end

    def words_tried
      @tries
    end

    def add_try(word)
      @tries << word
    end
  end
end
