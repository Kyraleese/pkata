module SearchMethods
  class Vertical
    attr_accessor :grid

    def initialize(grid)
      @grid = grid.transpose
    end
  end
end
