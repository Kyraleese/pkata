module SearchMethods
  class Vertical
    attr_accessor :grid

    def initialize(grid)
      @grid = grid.transpose
    end

    def index_of_word(list, word)
      list.join('').index(word)
    end

  end
end
