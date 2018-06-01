require_relative "base.rb"

module SearchMethods
  class DiagonalDown < Base
    def initialize(grid)
      @grid = grid

      grid_length = @grid.length

      @grid.each_with_index do |row, i|
        @grid[i] = Array.new((grid_length - i), ' ') + @grid[i] + Array.new(i, ' ')      
      end

      @grid = @grid.transpose
    end
  end
end
