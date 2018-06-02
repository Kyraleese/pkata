require_relative "base.rb"

module SearchMethods
  class DiagonalUp < Base
    attr_accessor :original_grid_length

    def initialize(grid)
      @grid = grid

      @original_grid_length = @grid.length

      @grid.each_with_index do |row, i|
        @grid[i] = Array.new(i, ' ') + @grid[i] + Array.new((@original_grid_length - i), ' ')
      end

      @grid = @grid.reverse.transpose
    end

  end
end
