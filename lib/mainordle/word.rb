module Mainordle
  class Word
    def initialize(word)
      @word = word
    end

    def valid?
      @word.size == 5
    end

    def letters
      @word.split(//)
    end
  end
end
