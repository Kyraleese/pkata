module SearchMethods
  class Horizontal
    attr_accessor :grid

    def initialize(grid)
      @grid = grid
    end

    def index_of_word(list, word)
      list.join('').index(word)
    end

  end
end
