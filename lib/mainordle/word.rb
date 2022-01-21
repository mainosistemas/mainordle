module Mainordle
  class Word
    ONLY_LETTERS = /\A[a-z]+\z/i

    def initialize(word)
      @word = word

      validate_word!
    end

    def letters
      @word.split(//)
    end

    private

    def validate_word!
      if @word.size != 5
        raise ArgumentError, "does not have 5 letters"
      end

      unless @word.match(ONLY_LETTERS)
        raise ArgumentError, "has invalid characters"
      end
    end

  end
end
